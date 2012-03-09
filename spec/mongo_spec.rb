require 'spec_helper'
require 'rspec'
require 'rack/test'
require 'json'

set :environment, :test

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end