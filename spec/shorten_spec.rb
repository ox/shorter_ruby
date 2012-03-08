require 'spec_helper'
require 'rspec'
require 'rack/test'

set :environment, :test

describe "basic functionality" do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  it "say 'hello world'" do
    get '/'
    last_response.should be_ok
    last_response.body.should == "hello world"
  end
end

describe "URL shortener" do
  it "should redirect to home if no url given" do
    get '/shorten?'
    last_response.status.should == 301
    last_response.headers["location"].should == "http://localhost:4567/"
  end
  
  it "should redirect to home if no such shortened url exists" do
    get '/NOTEXISTANT'
    last_response.status.should == 301
    last_response.headers["location"].should == "http://localhost:4567/"
  end
end