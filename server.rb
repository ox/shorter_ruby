require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :session_secret, 'supea1213sdar secadfgwr4e12312t'
set :erb, :layout => :layout

require 'mongo'
db = nil
shortcuts = nil

# when we get a mongo server, this is how the db stuff will look, maybe
# ENV ||= {}
# ENV['MONGOLAB_URI'] ||= "mongodb://heroku_app1970427:v0239d4ar55rle2857h8m0ba6o@ds029217.mongolab.com:29217/heroku_app1970427"
# uri  = URI.parse(ENV['MONGOLAB_URI'])
# begin
#   conn = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'])
#   if conn
#     db = conn.db(uri.path.gsub(/^\//, ''))
#     shortcuts = db["shortcuts"]
#   end
# rescue
#   
# end

get '/' do
  "hello world"
end

# takes a single param, url and returns a json object with the shortened url
#
# doc: {
#   url: "shortener.com/asb123"
# }
get '/shorten' do
  redirect("/") if params["url"].nil?
  
end