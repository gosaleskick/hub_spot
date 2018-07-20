# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::OAuth::Token::Refresher do
  let(:token) { TokenAR.new(expires_at: Date.parse('2018-01-01').to_time) }

  describe '#refresh' do
    context 'successful refresh' do
      it 'returns updated token', :vcr do
        updated_token = described_class.new(token).refresh

        expect(updated_token.portal_id).to eq(4738746)
        expect(updated_token.expires_at).to eq(Time.parse('Wed, 18 Jul 2018 14:24:06 GMT'))
        expect(HubSpot::Encryptor.decrypt(updated_token.encrypted_access_token)).to eq('new_access_token')
        expect(HubSpot::Encryptor.decrypt(updated_token.encrypted_refresh_token)).to eq('refresh_token')
      end
    end

    context 'unsuccessful refresh' do
      it 'raises an error', :vcr do
        expect { described_class.new(token).refresh }
          .to raise_error HubSpot::OAuth::Token::Refresher::RefreshError, 'missing or invalid refresh token'
      end
    end
  end

  describe 'self.should_refresh?' do
    context 'old token' do
      it 'returns true' do
        expect(described_class.should_refresh?(token)).to eq(true)
      end
    end

    context 'new token' do
      let(:token) { OpenStruct.new(expires_at: Date.parse('2050-01-01').to_time) }

      it 'returns false' do
        expect(described_class.should_refresh?(token)).to eq(false)
      end
    end
  end
end
