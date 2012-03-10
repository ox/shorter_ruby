require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :session_secret, 'supea1213sdar secadfgwr4e12312t'
set :erb, :layout => :layout

shortcuts = {'abc123' => "http://www.google.com/"}

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

get '/:short_code' do
  redirect("/") if params[:short_code].nil? || shortcuts[params[:short_code]].nil?
  redirect(shortcuts[params[:short_code]])
end