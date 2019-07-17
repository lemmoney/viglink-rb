# frozen_string_literal: true

require 'bundler/setup'
require 'dotenv/load'
require 'vcr'
require 'factory_bot'

require 'viglink'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<API_KEY>') { ENV['VIGLINK_API_KEY'] }
  config.filter_sensitive_data('<SECRET_KEY>') { ENV['VIGLINK_SECRET_KEY'] }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
