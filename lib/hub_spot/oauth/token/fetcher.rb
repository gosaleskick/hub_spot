# frozen_string_literal: true

module HubSpot
  module OAuth
    module Token
      class Fetcher < Base
        class FetchTokenError < StandardError; end

        def initialize(code)
          @code = code
        end

        def fetch
          raise FetchTokenError, response_body[:message] unless response.success?
          token_attributes
        end

        private

        attr_reader :code

        def response
          @response ||= post_request(:authorization_code, { code: code })
        end
      end
    end
  end
end
