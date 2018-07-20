# frozen_string_literal: true

module HubSpot
  module Connection
    class MissingParameter < StandardError; end

    API_URL = 'https://api.hubapi.com'

    private

    def access_token
      HubSpot::Encryptor.decrypt(token.encrypted_access_token)
    end

    def get(endpoint_path, **params)
      request(:get, endpoint_path, params)
    end

    def refresh_token
      return unless HubSpot::OAuth::Token::Refresher.should_refresh?(token)

      @token = HubSpot::OAuth::Token::Refresher.new(token).refresh
    end

    def request(method, endpoint_path, **params)
      body = method == :get ? nil : Oj.dump(params, mode: :compat)
      params = body ? nil : params

      refresh_token

      response = Faraday.public_send(method) do |request|
        request.url "#{API_URL}#{endpoint_path}"
        request.params = params
        request.body = body
        request.headers =  {
          'Accept' => 'application/json',
          'Authorization' => "Bearer #{access_token}"
        }
        request.options.params_encoder = Faraday::FlatParamsEncoder
      end

      Oj.load(response.body, symbol_keys: true, mode: :strict)
    end
  end
end
