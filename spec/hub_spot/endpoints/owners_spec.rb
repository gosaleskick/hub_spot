# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::Endpoints::Owners do
  let(:token) { TokenAR.new }
  let(:client) { HubSpot::OAuth::Client.new(token: token) }

  describe 'GET /owners/v2/owners' do
    it 'returns result object with json response', :vcr do
      result = client.owners

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match([
        {
          portalId: 4738746,
          ownerId: 32921899,
          type: "PERSON",
          firstName: "Adam",
          lastName: "Zapaśnik",
          email: "adam@saleskick.co",
          createdAt: 1531736873605,
          updatedAt: 1531736873605,
          remoteList: [
            {
              id: 28319039,
              portalId: 4738746,
              ownerId: 32921899,
              remoteId: "6212350",
              remoteType: "HUBSPOT",
              active: true
            }
          ],
          hasContactsAccess: false
        }
      ])
    end
  end
end
