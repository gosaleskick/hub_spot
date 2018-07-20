# frozen_string_literal: true

require 'faraday'
require 'oj'
require 'rbnacl/libsodium'

require 'hub_spot/configuration'
require 'hub_spot/encryptor'
require 'hub_spot/version'

module HubSpot
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
