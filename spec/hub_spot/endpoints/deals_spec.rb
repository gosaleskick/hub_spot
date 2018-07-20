# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::Endpoints::Deals do
  let(:token) { TokenAR.new }
  let(:client) { HubSpot::OAuth::Client.new(token: token) }

  describe 'GET /deals/v1/deal/paged' do
    it 'returns result object with json response', :vcr do
      result = client.deals(properties: ['hubspot_owner_id', 'amount'])

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        deals: [
          {
            portalId: 4738746,
            dealId: 322296361,
            isDeleted: false,
            associations: nil,
            properties: {
              amount: {
                value: "40",
                timestamp: 1531737409030,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "amount",
                  value: "40",
                  timestamp: 1531737409030,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_owner_id:{
                value: "32921899",
                timestamp: 1531737409030,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [
                  {
                    name: "hubspot_owner_id",
                    value: "32921899",
                    timestamp: 1531737409030,
                    sourceId: "adam@saleskick.co",
                    source: "CRM_UI",
                    sourceVid: []
                  }
                ]
              }
            },
            imports: [],
            stateChanges: []
          }, {
            portalId: 4738746,
            dealId: 322298530,
            isDeleted: false,
            associations: nil,
            properties: {
              amount: {
                value: "45",
                timestamp: 1531744369560,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "amount",
                  value: "45",
                  timestamp: 1531744369560,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_owner_id:{
                value: "32921899",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [
                  {
                    name: "hubspot_owner_id",
                    value: "32921899",
                    timestamp: 1531743503592,
                    sourceId: "adam@saleskick.co",
                    source: "CRM_UI",
                    sourceVid: []
                  }
                ]
              }
            },
            imports: [],
            stateChanges: []
          }
        ],
        hasMore: false,
        offset: 322298530
      })
    end

    it 'returns result object with ability to query more data', :vcr do
      result = client.deals(limit: 1)
      more_items_result = result.more_items

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        deals: [
          {
            portalId: 4738746,
            dealId: 322296361,
            isDeleted: false,
            associations: nil,
            properties: {},
            imports: [],
            stateChanges: []
          }
        ],
        hasMore: true,
        offset: 322296361
      })
      expect(more_items_result).to be_a(HubSpot::Result)
      expect(more_items_result.data).to match({
        deals: [
          {
            portalId: 4738746,
            dealId: 322298530,
            isDeleted: false,
            associations: nil,
            properties: {},
            imports: [],
            stateChanges: []
          }
        ],
        hasMore: false,
        offset: 322298530
      })
    end
  end

  describe 'GET /deals/v1/deal/recent/modified' do
    it 'returns result object with json response', :vcr do
      result = client.recently_modified_deals(since: 1531744369000)

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [
          {
            portalId: 4738746,
            dealId: 322298530,
            isDeleted: false,
            associations: {
              associatedVids: [],
              associatedCompanyIds: [],
              associatedDealIds: []
            },
            properties: {
              dealname: {
                value: "newdeal",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "dealname",
                  value: "newdeal",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              amount: {
                value: "45",
                timestamp: 1531744369560,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "amount",
                  value: "45",
                  timestamp: 1531744369560,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              closedate: {
                value: "1533039500099",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "closedate",
                  value: "1533039500099",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              num_associated_contacts: {
                value: "0",
                timestamp: 0,
                source: "CALCULATED",
                sourceId: nil,
                versions: [{
                  name: "num_associated_contacts",
                  value: "0",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              hs_all_team_ids: {
                value: "",
                timestamp: 1531743503856,
                source: "CALCULATED",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hs_all_team_ids",
                  value: "",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              createdate: {
                value: "1531743500100",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "createdate",
                  value: "1531743500100",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              pipeline: {
                value: "default",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "pipeline",
                  value: "default",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_team_id: {
                value: "",
                timestamp: 1531743503856,
                source: "CRM_UI",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hubspot_team_id",
                  value: "",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_owner_id: {
                value: "32921899",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "hubspot_owner_id",
                  value: "32921899",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hs_lastmodifieddate: {
                value: "1531744383748",
                timestamp: 1531744383748,
                source: "CALCULATED",
                sourceId: nil,
                versions: [{
                  name: "hs_lastmodifieddate",
                  value: "1531744383748",
                  timestamp: 1531744383748,
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              hs_analytics_source: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hubspot_owner_assigneddate: {
                value: "1531743503592",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "hubspot_owner_assigneddate",
                  value: "1531743503592",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              dealstage: {
                value: "closedwon",
                timestamp: 1531744383748,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "dealstage",
                  value: "closedwon",
                  timestamp: 1531744383748,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hs_createdate: {
                value: "1531743503592",
                timestamp: 1531743503592,
                source: "CONTACTS",
                sourceId: "CRM_UI",
                versions: [{
                  name: "hs_createdate",
                  value: "1531743503592",
                  timestamp: 1531743503592,
                  sourceId: "CRM_UI",
                  source: "CONTACTS",
                  sourceVid: []
                }]
              },
              hs_analytics_source_data_2: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source_data_2",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hs_analytics_source_data_1: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source_data_1",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hs_all_owner_ids: {
                value: "32921899",
                timestamp: 1531743503856,
                source: "CALCULATED",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hs_all_owner_ids",
                  value: "32921899",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              }
            },
            imports: [],
            stateChanges: []
          }
        ],
        hasMore: false,
        offset: 1,
        total: 1
      })
    end

    it 'returns result object with ability to query more data', :vcr do
      result = client.recently_modified_deals(count: 1)
      more_items_result = result.more_items

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [
          {
            portalId: 4738746,
            dealId: 322298530,
            isDeleted: false,
            associations: {
              associatedVids: [],
              associatedCompanyIds: [],
              associatedDealIds: []
            },
            properties: {
              dealname: {
                value: "newdeal",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "dealname",
                  value: "newdeal",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              amount: {
                value: "45",
                timestamp: 1531744369560,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "amount",
                  value: "45",
                  timestamp: 1531744369560,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              closedate: {
                value: "1533039500099",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "closedate",
                  value: "1533039500099",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              num_associated_contacts: {
                value: "0",
                timestamp: 0,
                source: "CALCULATED",
                sourceId: nil,
                versions: [{
                  name: "num_associated_contacts",
                  value: "0",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              hs_all_team_ids: {
                value: "",
                timestamp: 1531743503856,
                source: "CALCULATED",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hs_all_team_ids",
                  value: "",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              createdate: {
                value: "1531743500100",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "createdate",
                  value: "1531743500100",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              pipeline: {
                value: "default",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "pipeline",
                  value: "default",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_team_id: {
                value: "",
                timestamp: 1531743503856,
                source: "CRM_UI",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hubspot_team_id",
                  value: "",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hubspot_owner_id: {
                value: "32921899",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "hubspot_owner_id",
                  value: "32921899",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hs_lastmodifieddate: {
                value: "1531744383748",
                timestamp: 1531744383748,
                source: "CALCULATED",
                sourceId: nil,
                versions: [{
                  name: "hs_lastmodifieddate",
                  value: "1531744383748",
                  timestamp: 1531744383748,
                  source: "CALCULATED",
                  sourceVid: []
                }]
              },
              hs_analytics_source: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hubspot_owner_assigneddate: {
                value: "1531743503592",
                timestamp: 1531743503592,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "hubspot_owner_assigneddate",
                  value: "1531743503592",
                  timestamp: 1531743503592,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              dealstage: {
                value: "closedwon",
                timestamp: 1531744383748,
                source: "CRM_UI",
                sourceId: "adam@saleskick.co",
                versions: [{
                  name: "dealstage",
                  value: "closedwon",
                  timestamp: 1531744383748,
                  sourceId: "adam@saleskick.co",
                  source: "CRM_UI",
                  sourceVid: []
                }]
              },
              hs_createdate: {
                value: "1531743503592",
                timestamp: 1531743503592,
                source: "CONTACTS",
                sourceId: "CRM_UI",
                versions: [{
                  name: "hs_createdate",
                  value: "1531743503592",
                  timestamp: 1531743503592,
                  sourceId: "CRM_UI",
                  source: "CONTACTS",
                  sourceVid: []
                }]
              },
              hs_analytics_source_data_2: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source_data_2",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hs_analytics_source_data_1: {
                value: "",
                timestamp: 1531743503952,
                source: "DEALS",
                sourceId: "deal sync with no associated contacts",
                versions: [{
                  name: "hs_analytics_source_data_1",
                  value: "",
                  timestamp: 1531743503952,
                  sourceId: "deal sync with no associated contacts",
                  source: "DEALS",
                  sourceVid: []
                }]
              },
              hs_all_owner_ids: {
                value: "32921899",
                timestamp: 1531743503856,
                source: "CALCULATED",
                sourceId: "PermissionsUpdater",
                versions: [{
                  name: "hs_all_owner_ids",
                  value: "32921899",
                  timestamp: 1531743503856,
                  sourceId: "PermissionsUpdater",
                  source: "CALCULATED",
                  sourceVid: []
                }]
              }
            },
            imports: [],
            stateChanges: []
          }
        ],
        hasMore: true,
        offset: 1,
        total: 2
      })
      expect(more_items_result).to be_a(HubSpot::Result)
      expect(more_items_result.data).to match({
        results: [{
          portalId: 4738746,
          dealId: 322296361,
          isDeleted: false,
          associations: {
            associatedVids:[],
            associatedCompanyIds: [],
            associatedDealIds: []
          },
          properties: {
            dealname: {
              value: "simpledeal",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "dealname",
                value: "simpledeal",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            amount: {
              value: "40",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "amount",
                value: "40",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            closedate: {
              value: "1533033390779",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "closedate",
                value: "1533033390779",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            num_associated_contacts: {
              value: "0",
              timestamp: 0,
              source: "CALCULATED",
              sourceId: nil,
              versions: [{
                name: "num_associated_contacts",
                value: "0",
                source: "CALCULATED",
                sourceVid: []
              }]
            },
            hs_all_team_ids: {
              value: "",
              timestamp: 1531737411121,
              source: "CALCULATED",
              sourceId: "PermissionsUpdater",
              versions: [{
                name: "hs_all_team_ids",
                value: "",
                timestamp: 1531737411121,
                sourceId: "PermissionsUpdater",
                source: "CALCULATED",
                sourceVid: []
              }]
            },
            createdate: {
              value: "1531737390780",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "createdate",
                value: "1531737390780",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            pipeline: {
              value: "default",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "pipeline",
                value: "default",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            hubspot_team_id: {
              value: "",
              timestamp: 1531737411121,
              source: "CRM_UI",
              sourceId: "PermissionsUpdater",
              versions: [{
                name: "hubspot_team_id",
                value: "",
                timestamp: 1531737411121,
                sourceId: "PermissionsUpdater",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            hubspot_owner_id: {
              value: "32921899",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "hubspot_owner_id",
                value: "32921899",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            hs_lastmodifieddate: {
              value: "1531737411765",
              timestamp: 1531737411765,
              source: "CALCULATED",
              sourceId: nil,
              versions: [{
                name: "hs_lastmodifieddate",
                value: "1531737411765",
                timestamp: 1531737411765,
                source: "CALCULATED",
                sourceVid: []
              }]
            },
            hs_analytics_source: {
              value: "",
              timestamp: 1531737409413,
              source: "DEALS",
              sourceId: "deal sync with no associated contacts",
              versions: [{
                name: "hs_analytics_source",
                value: "",
                timestamp: 1531737409413,
                sourceId: "deal sync with no associated contacts",
                source: "DEALS",
                sourceVid: []
              }]
            },
            hubspot_owner_assigneddate: {
              value: "1531737409030",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "hubspot_owner_assigneddate",
                value: "1531737409030",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            dealstage: {
              value: "appointmentscheduled",
              timestamp: 1531737409030,
              source: "CRM_UI",
              sourceId: "adam@saleskick.co",
              versions: [{
                name: "dealstage",
                value: "appointmentscheduled",
                timestamp: 1531737409030,
                sourceId: "adam@saleskick.co",
                source: "CRM_UI",
                sourceVid: []
              }]
            },
            hs_createdate: {
              value: "1531737409030",
              timestamp: 1531737409030,
              source: "CONTACTS",
              sourceId: "CRM_UI",
              versions: [{
                name: "hs_createdate",
                value: "1531737409030",
                timestamp: 1531737409030,
                sourceId: "CRM_UI",
                source: "CONTACTS",
                sourceVid: []
              }]
            },
            hs_analytics_source_data_2: {
              value: "",
              timestamp: 1531737409413,
              source: "DEALS",
              sourceId: "deal sync with no associated contacts",
              versions: [{
                name: "hs_analytics_source_data_2",
                value: "",
                timestamp: 1531737409413,
                sourceId: "deal sync with no associated contacts",
                source: "DEALS",
                sourceVid: []
              }]
            },
            hs_analytics_source_data_1: {
              value: "",
              timestamp: 1531737409413,
              source: "DEALS",
              sourceId: "deal sync with no associated contacts",
              versions: [{
                name: "hs_analytics_source_data_1",
                value: "",
                timestamp: 1531737409413,
                sourceId: "deal sync with no associated contacts",
                source: "DEALS",
                sourceVid: []
              }]
            },
            hs_all_owner_ids: {
              value: "32921899",
              timestamp: 1531737411121,
              source: "CALCULATED",
              sourceId: "PermissionsUpdater",
              versions: [{
                name: "hs_all_owner_ids",
                value: "32921899",
                timestamp: 1531737411121,
                sourceId: "PermissionsUpdater",
                source: "CALCULATED",
                sourceVid: []
              }]
            }
          },
          imports: [],
          stateChanges: []
        }],
        hasMore: false,
        offset: 2,
        total: 2
      })
    end
  end
end
