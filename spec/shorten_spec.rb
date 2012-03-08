require 'spec_helper'
require 'rspec'
require 'rack/test'

set :environment, :test

describe "basic functionality" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  it "says 'hello world'" do
    get '/'
    last_response.should be_ok
    last_response.body.should == "hello world"
  end
end
