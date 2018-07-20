# frozen_string_literal: true

module HubSpot
  module Endpoints
    module OAuth
      def access_token_info
        HubSpot::Result.new(data: get("/oauth/v1/access-tokens/#{access_token}"))
      end
    end
  end
end
