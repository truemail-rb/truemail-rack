# frozen_string_literal: true

require 'simplecov'
require 'rack/test'

lib = File.join(File.dirname(__FILE__), '../app/**/*.rb')
rspec_custom = File.join(File.dirname(__FILE__), 'support/**/*.rb')

[lib, rspec_custom].each do |folder|
  Dir[File.expand_path(folder)].each { |file| require file }
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
