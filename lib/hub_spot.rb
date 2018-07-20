# frozen_string_literal: true

require 'faraday'
require 'oj'
require 'rbnacl/libsodium'

require 'hub_spot/configuration'
require 'hub_spot/connection'
require 'hub_spot/encryptor'
require 'hub_spot/result'
require 'hub_spot/endpoints/deals'
require 'hub_spot/endpoints/oauth'
require 'hub_spot/oauth/client'
require 'hub_spot/oauth/token/base'
require 'hub_spot/oauth/token/fetcher'
require 'hub_spot/oauth/token/refresher'
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
