ENV["RACK_ENV"] ||= "test"
require 'bundler'
Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/rspec'

Capybara.app = LittleShopApp
Capybara.save_path = 'tmp/capybara'


DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include Capybara::DSL
end
