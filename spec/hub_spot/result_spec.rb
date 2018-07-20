# frozen_string_literal: true

require 'spec_helper'

describe HubSpot::Result do
  describe '#data' do
    it 'returns data' do
      result = HubSpot::Result.new(data: 'new_data')

      expect(result.data).to eq 'new_data'
    end
  end

  describe '#more_items' do
    it 'returns nil when hasMore is false' do
      response_data = { hasMore: false }
      result = HubSpot::Result.new(data: response_data)

      expect(result.more_items).to eq nil
    end
  end
end
