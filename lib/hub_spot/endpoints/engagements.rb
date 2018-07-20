# frozen_string_literal: true

module HubSpot
  module Endpoints
    module Engagements
      MAX_LIMIT = 250
      MAX_COUNT = 100

      def engagements(**params)
        params[:limit] ||= MAX_LIMIT

        HubSpot::Result.new(
          client: self,
          data: get('/engagements/v1/engagements/paged', params),
          endpoint: :engagements,
          params: params
        )
      end

      def recent_engagements(**params)
        params[:count] ||= MAX_COUNT

        HubSpot::Result.new(
          client: self,
          data: get('/engagements/v1/engagements/recent/modified', params),
          endpoint: :recent_engagements,
          params: params
        )
      end
    end
  end
end
