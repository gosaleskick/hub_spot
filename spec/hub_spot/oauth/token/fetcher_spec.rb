# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::OAuth::Token::Fetcher do
  describe '#fetch' do
    let(:instance) { described_class.new(code) }

    context 'invalid token' do
      let(:code) { 'invalid_code' }

      it 'raises an error', :vcr do
        expect { instance.fetch }
          .to raise_error HubSpot::OAuth::Token::Fetcher::FetchTokenError, "missing or unknown auth code"
      end
    end

    context 'valid token' do
      let(:code) { 'code' }

      subject { instance.fetch }

      it 'returns hash with token attributes', :vcr do
        expect(subject).to match(
          encrypted_access_token: be_a(String),
          encrypted_refresh_token: be_a(String),
          expires_at: Time.parse('Fri, 20 Jul 2018 16:01:50 GMT'),
          portal_id: 4738746
        )
        expect(HubSpot::Encryptor.decrypt(subject[:encrypted_access_token])).to eq('access_token')
        expect(HubSpot::Encryptor.decrypt(subject[:encrypted_refresh_token])).to eq('refresh_token')
      end
    end
  end
end
