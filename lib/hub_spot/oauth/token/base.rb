# frozen_string_literal: true

module HubSpot
  module OAuth
    module Token
      class Base
        TOKEN_REQUEST_URL = 'https://api.hubapi.com/oauth/v1/token'

        private

        def encrypted_access_token
          HubSpot::Encryptor.encrypt(response_body[:access_token])
        end

        def encrypted_refresh_token
          HubSpot::Encryptor.encrypt(response_body[:refresh_token])
        end

        def expires_at
          @expires_at ||= Time.parse(response.headers['date']) + response_body[:expires_in].to_i
        end

        def portal_id
          ::HubSpot::OAuth::Client.new(token:
            OpenStruct.new(encrypted_access_token: encrypted_access_token, expires_at: expires_at)
          ).access_token_info.data[:hub_id]
        end

        def post_request(grant_type, params)
          Faraday.post do |request|
            request.url TOKEN_REQUEST_URL
            request.body = {
              grant_type: grant_type,
              client_id: HubSpot.configuration.client_id,
              client_secret: HubSpot.configuration.client_secret,
              redirect_uri: HubSpot.configuration.redirect_uri
            }.merge!(params)
            request.headers = {
              'Content-Type' => 'application/x-www-form-urlencoded'
            }
          end
        end

        def response
          raise NotImplementedError
        end

        def response_body
          @response_body ||= Oj.load(response.body, symbol_keys: true)
        end

        def token_attributes
          {
            portal_id: portal_id,
            encrypted_access_token: encrypted_access_token,
            encrypted_refresh_token: encrypted_refresh_token,
            expires_at: expires_at
          }
        end
      end
    end
  end
end
