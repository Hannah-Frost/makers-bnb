ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require_relative './reset_test_database'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = MakersBnB

RSpec.configure do |config|
  config.before(:each) do
    reset_test_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
