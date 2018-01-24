ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'pry'
require 'bundler'
Bundler.require(:default, :test)

Capybara.app = LittleShopApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
end
