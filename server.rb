require 'sinatra'
require 'json'
require 'net/http'
require 'pry'
require 'watir'
require "selenium-webdriver"
require 'active_support/core_ext/integer/inflections'
require './app/routers/request_router'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'

post '/' do
  session[:message] = "Here is your session!"
  @browser = Watir::Browser.new
  launch_response = RequestRouter.new(JSON.parse(request.body.read), @browser)
  launch_response.format_response
  # number = JSON.parse(request.body.read)["request"]["intent"]["slots"]["value"]
  # number_facts_uri = URI("numbersapi.com/#{number}")
  # number_fact = Net::HTTP.get(number_facts_uri)

  # {
  #   version: "1.0",
  #   response: {
  #     outputSpeech: {
  #       type: "PlainText",
  #       text: "Welcome to Recipe Friend, what would you like me to do?"
  #     }
  #   }
  # }.to_json
end
