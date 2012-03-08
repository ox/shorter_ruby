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
  
  it "fails if no url given" do
    get '/shorten?'
    last_response.status.should == 404
  end
  
  it "fails if no such shortened url exists" do
    get '/123'
    last_response.status.should == 404
  end
end
