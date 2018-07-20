# frozen_string_literal: true

module HubSpot
  module OAuth
    class Client
      include HubSpot::Connection
      include HubSpot::Endpoints::Deals
      include HubSpot::Endpoints::Engagements
      include HubSpot::Endpoints::OAuth

      def initialize(token:)
        @token = token
      end

      private

      attr_reader :token
    end
  end
end
