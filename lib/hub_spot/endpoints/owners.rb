# frozen_string_literal: true

module HubSpot
  module Endpoints
    module Owners
      def owners
        HubSpot::Result.new(data: get('/owners/v2/owners'))
      end
    end
  end
end
