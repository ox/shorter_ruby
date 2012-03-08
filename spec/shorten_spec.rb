require 'spec_helper'
require 'rspec'
require 'rack/test'
require 'json'

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

  it "returns a json object containing a url" do
	  get '/shorten?url=www.google.com'
	  parsed_body = JSON.parse last_response.body
	  parsed_body["url"].nil?.should == false
  end
end
