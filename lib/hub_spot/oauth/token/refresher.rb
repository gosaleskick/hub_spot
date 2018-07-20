# frozen_string_literal: true

module HubSpot
  module OAuth
    module Token
      class Refresher < Base
        class RefreshError < StandardError; end

        SAFE_REQUEST_MARGIN_IN_SECONDS = 10

        class << self
          def should_refresh?(token)
            token.expires_at <= Time.now.utc - SAFE_REQUEST_MARGIN_IN_SECONDS
          end
        end

        def initialize(token)
          @token = token
        end

        def refresh
          raise RefreshError, response_body[:message] unless response.success?

          token.update(token_attributes)
          token
        end

        private

        attr_reader :token


        def encrypted_refresh_token
          @encrypted_refresh_token ||= token.encrypted_refresh_token
        end

        def refresh_token
          HubSpot::Encryptor.decrypt(encrypted_refresh_token)
        end

        def response
          @response ||= post_request(:refresh_token, { refresh_token: refresh_token })
        end

        def portal_id
          token.portal_id
        end
      end
    end
  end
end
