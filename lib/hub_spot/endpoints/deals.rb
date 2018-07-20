# frozen_string_literal: true

module HubSpot
  module Endpoints
    module Deals
      MAX_LIMIT = 250
      MAX_COUNT = 100

      def deals(**params)
        params[:limit] ||= MAX_LIMIT

        HubSpot::Result.new(
          client: self,
          data: get('/deals/v1/deal/paged', params),
          endpoint: :deals,
          params: params
        )
      end

      def recently_modified_deals(**params)
        params[:count] ||= MAX_COUNT

        HubSpot::Result.new(
          client: self,
          data: get('/deals/v1/deal/recent/modified', params),
          endpoint: :recently_modified_deals,
          params: params
        )
      end
    end
  end
end
