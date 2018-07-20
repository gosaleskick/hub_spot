# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::Endpoints::Engagements do
  let(:token) { TokenAR.new }
  let(:client) { HubSpot::OAuth::Client.new(token: token) }

  describe 'GET /engagements/v1/engagements/paged' do
    it 'returns result object with json response', :vcr do
      result = client.engagements(properties: ['hubspot_owner_id', 'amount'])

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [
          {
            engagement: {
              id: 1092032676,
              portalId: 4738746,
              active: true,
              createdAt: 1531741760764,
              lastUpdated: 1531741760764,
              createdBy: 6212350,
              modifiedBy: 6212350,
              ownerId: 32921899,
              type: "TASK",
              timestamp: 1531778400000
            },
            associations: {
              contactIds: [],
              companyIds: [],
              dealIds: [],
              ownerIds: [],
              workflowIds: [],
              ticketIds: [],
              contentIds: []
            },
            attachments: [],
            scheduledTasks: [{
              engagementId: 1092032676,
              portalId: 4738746,
              engagementType: "TASK",
              taskType: "REMINDER",
              timestamp: 1531807200000,
              uuid: "TASK:b90ec6f0-d785-4834-8c25-b5123578a77f"
            }],
            metadata: {
              status: "NOT_STARTED",
              subject: "calllme",
              taskType: "CALL",
              reminders: [1531807200000]
            }
          }, {
            engagement: {
              id: 1092079756,
              portalId: 4738746,
              active: true,
              createdAt: 1531742075720,
              lastUpdated: 1531742080573,
              createdBy: 6212350,
              modifiedBy: 6212350,
              ownerId: 32921899,
              type: "TASK",
              timestamp: 1531778400000
            },
            associations: {
              contactIds: [],
              companyIds: [],
              dealIds: [],
              ownerIds: [],
              workflowIds: [],
              ticketIds: [],
              contentIds: []},
              attachments: [],
            scheduledTasks: [{
              engagementId: 1092079756,
              portalId: 4738746,
              engagementType: "TASK",
              taskType: "REMINDER",
              timestamp: 1531807200000,
              uuid: "TASK:232b3235-fb4c-4b0c-8f02-eacc8b25c4f4"
            }],
            metadata: {
              status: "COMPLETED",
              subject: "mailcompleted",
              taskType: "EMAIL",
              reminders: [1531807200000]
            }
          }
        ],
        hasMore: false,
        offset: 1092079756
      })
    end

    it 'returns result object with ability to query more data', :vcr do
      result = client.engagements(limit: 1)
      more_items_result = result.more_items

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [{
          engagement: {
            id: 1092032676,
            portalId: 4738746,
            active: true,
            createdAt: 1531741760764,
            lastUpdated: 1531741760764,
            createdBy: 6212350,
            modifiedBy: 6212350,
            ownerId: 32921899,
            type: "TASK",
            timestamp: 1531778400000
          },
          associations: {
            contactIds: [],
            companyIds: [],
            dealIds: [],
            ownerIds: [],
            workflowIds: [],
            ticketIds: [],
            contentIds: []
          },
          attachments: [],
          scheduledTasks: [{
            engagementId: 1092032676,
            portalId: 4738746,
            engagementType: "TASK",
            taskType: "REMINDER",
            timestamp: 1531807200000,
            uuid: "TASK:b90ec6f0-d785-4834-8c25-b5123578a77f"
          }],
          metadata: {
            status: "NOT_STARTED",
            subject: "calllme",
            taskType: "CALL",
            reminders: [1531807200000]
          }
        }],
        hasMore: true,
        offset: 1092032676
      })
      expect(more_items_result).to be_a(HubSpot::Result)
      expect(more_items_result.data).to match({
        results: [{
          engagement: {
            id: 1092079756,
            portalId: 4738746,
            active: true,
            createdAt: 1531742075720,
            lastUpdated: 1531742080573,
            createdBy: 6212350,
            modifiedBy: 6212350,
            ownerId: 32921899,
            type: "TASK",
            timestamp: 1531778400000
          },
          associations: {
            contactIds: [],
            companyIds: [],
            dealIds: [],
            ownerIds: [],
            workflowIds: [],
            ticketIds: [],
            contentIds: []},
            attachments: [],
          scheduledTasks: [{
            engagementId: 1092079756,
            portalId: 4738746,
            engagementType: "TASK",
            taskType: "REMINDER",
            timestamp: 1531807200000,
            uuid: "TASK:232b3235-fb4c-4b0c-8f02-eacc8b25c4f4"
          }],
          metadata: {
            status: "COMPLETED",
            subject: "mailcompleted",
            taskType: "EMAIL",
            reminders: [1531807200000]
          }
        }],
        hasMore: false,
        offset: 1092079756
      })
    end
  end

  describe 'GET /engagements/v1/engagements/recent/modified' do
    it 'returns result object with json response', :vcr do
      result = client.recent_engagements(since: 1531741760765)

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [{
          engagement: {
            id: 1092079756,
            portalId: 4738746,
            active: true,
            createdAt: 1531742075720,
            lastUpdated: 1531742080573,
            createdBy: 6212350,
            modifiedBy: 6212350,
            ownerId: 32921899,
            type: "TASK",
            timestamp: 1531778400000
          },
          associations: {
            contactIds: [],
            companyIds: [],
            dealIds: [],
            ownerIds: [],
            workflowIds: [],
            ticketIds: [],
            contentIds: []},
            attachments: [],
          scheduledTasks: [{
            engagementId: 1092079756,
            portalId: 4738746,
            engagementType: "TASK",
            taskType: "REMINDER",
            timestamp: 1531807200000,
            uuid: "TASK:232b3235-fb4c-4b0c-8f02-eacc8b25c4f4"
          }],
          metadata: {
            status: "COMPLETED",
            subject: "mailcompleted",
            taskType: "EMAIL",
            reminders: [1531807200000]
          }
        }],
        hasMore: false,
        offset: 1,
        total: 1
      })
    end

    it 'returns result object with ability to query more data', :vcr do
      result = client.recent_engagements(count: 1)
      more_items_result = result.more_items

      expect(result).to be_a(HubSpot::Result)
      expect(result.data).to match({
        results: [{
          engagement: {
            id: 1092079756,
            portalId: 4738746,
            active: true,
            createdAt: 1531742075720,
            lastUpdated: 1531742080573,
            createdBy: 6212350,
            modifiedBy: 6212350,
            ownerId: 32921899,
            type: "TASK",
            timestamp: 1531778400000
          },
          associations: {
            contactIds: [],
            companyIds: [],
            dealIds: [],
            ownerIds: [],
            workflowIds: [],
            ticketIds: [],
            contentIds: []
          },
          attachments: [],
          scheduledTasks: [{
            engagementId: 1092079756,
            portalId: 4738746,
            engagementType: "TASK",
            taskType: "REMINDER",
            timestamp: 1531807200000,
            uuid: "TASK:232b3235-fb4c-4b0c-8f02-eacc8b25c4f4"
          }],
          metadata: {
            status: "COMPLETED",
            subject: "mailcompleted",
            taskType: "EMAIL",
            reminders: [1531807200000]
          }
        }],
        hasMore: true,
        offset: 1,
        total: 2
      })
      expect(more_items_result).to be_a(HubSpot::Result)
      expect(more_items_result.data).to match({
        results: [{
          engagement: {
            id: 1092032676,
            portalId: 4738746,
            active: true,
            createdAt: 1531741760764,
            lastUpdated: 1531741760764,
            createdBy: 6212350,
            modifiedBy: 6212350,
            ownerId: 32921899,
            type: "TASK",
            timestamp: 1531778400000
          },
          associations: {
            contactIds: [],
            companyIds: [],
            dealIds: [],
            ownerIds: [],
            workflowIds: [],
            ticketIds: [],
            contentIds: []
          },
          attachments: [],
          scheduledTasks: [{
            engagementId: 1092032676,
            portalId: 4738746,
            engagementType: "TASK",
            taskType: "REMINDER",
            timestamp: 1531807200000,
            uuid: "TASK:b90ec6f0-d785-4834-8c25-b5123578a77f"
          }],
          metadata: {
            status: "NOT_STARTED",
            subject: "calllme",
            taskType: "CALL",
            reminders: [1531807200000]
          }
        }],
        hasMore: false,
        offset: 2,
        total: 2
      })
    end
  end
end
