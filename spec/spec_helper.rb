require 'rack/test'

ENV['RACK_ENV'] = 'test'
require File.expand_path('../../config/application', __FILE__)
require_relative 'factories/user_factory'
require 'sucker_punch/testing/inline'

RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  c.mock_with :rspec
  c.include Rack::Test::Methods
  c.include FactoryGirl::Syntax::Methods
end