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
  @browser = Watir::Browser.new
  # driver = Selenium::WebDriver.for:chrome
  # @browser = Selenium::WebDriver.for:chrome
  # session[:alexa] = @browser
  # session_id = @browser.send(:bridge).session_id
  # http = @browser.send(:bridge).http.send(:http)
  # server_url = @browser.send(:bridge).http.send(:server_url)
  # url = JSON.parse(server_url.to_json)

  launch_response = RequestRouter.new(JSON.parse(request.body.read), @browser)
  launch_response.format_response
  # number = JSON.parse(request.body.read)["request"]["intent"]["slots"]["value"]
  # number_facts_uri = URI("numbersapi.com/#{number}")
  # number_fact = Net::HTTP.get(number_facts_uri)
end
