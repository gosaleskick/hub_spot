# frozen_string_literal: true

module HubSpot
  class Result
    attr_reader :data, :client, :endpoint, :params

    def initialize(data:, client: nil, endpoint: nil, params: nil)
      @data = data
      @client = client
      @endpoint = endpoint
      @params = params
    end

    def more_items
      return unless data[:hasMore]
      params[:offset] = data[:offset]

      client.public_send(endpoint, params)
    end
  end
end
