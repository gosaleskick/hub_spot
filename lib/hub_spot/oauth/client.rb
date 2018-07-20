# frozen_string_literal: true

module HubSpot
  module OAuth
    class Client
      include HubSpot::Connection

      def initialize(token:)
        @token = token
      end

      private

      attr_reader :token
    end
  end
end
