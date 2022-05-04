require 'dotenv/load'
# Dotenv.load('../.env.test.local', '../.env.test')
Dotenv.overload '.env.test'
Dotenv.overload '.env.test.local'
require 'simplecov'
# SimpleCov.command_name "Test: #{rand(1024)}"
# p ENV.fetch('POSTGRES_DB', nil)
if ENV.fetch('COVERAGE', nil) == 'true'
  SimpleCov.start 'rails' do
    # track_files '**/*.rb'
    add_filter '/bin/'
    add_filter '/db/'
    add_filter '/spec/' # for rspec
    add_filter '/test/' # for minitest
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
