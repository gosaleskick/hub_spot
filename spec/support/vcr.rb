# frozen_string_literal: true
require 'vcr'

VCR.configure do |c|
  c.default_cassette_options = { match_requests_on: [:method, :uri, :body] }
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :faraday
  c.configure_rspec_metadata!
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end
