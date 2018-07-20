# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::Endpoints::OAuth do
  let(:token) { TokenAR.new }
  let(:client) { HubSpot::OAuth::Client.new(token: token) }

  describe 'GET /oauth/v1/access-tokens/:token' do
    it 'returns result object with json response', :vcr do
      result = client.access_token_info

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        app_id: 177721,
        expires_in: 19407,
        hub_domain: "adamsales-dev-4738746.com",
        hub_id: 4738746,
        scopes: ["contacts", "oauth"],
        token: "access_token",
        token_type: "access",
        user: "adam@saleskick.co",
        user_id: 6212350
      })
    end
  end
end
