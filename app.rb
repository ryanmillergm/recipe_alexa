require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require 'json'
require 'net/http'
require 'pry'
require 'watir'
require "selenium-webdriver"
require 'active_support/core_ext/integer/inflections'
require './app/routers/request_router'
require './app/models/browser'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'

post '/' do
  session[:message] = "Here is your session!"
  @browser = Watir::Browser.new

  launch_response = RequestRouter.new(JSON.parse(request.body.read), @browser)
  launch_response.format_response

end
