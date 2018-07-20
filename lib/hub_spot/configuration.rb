# frozen_string_literal: true

module HubSpot
  class Configuration
    attr_accessor :client_id, :client_secret, :redirect_uri, :secret_encryption_key

    def initialize
      @client_id = nil
      @client_secret = nil
      @redirect_uri = nil
      @secret_encryption_key = nil
    end
  end
end
