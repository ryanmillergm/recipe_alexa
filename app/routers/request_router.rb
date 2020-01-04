require 'sinatra'
require 'json'
require 'pry'
require './app/responses/launch_response'
require './app/handlers/intent_request_handler'

class RequestRouter
  attr_reader :json_response, :browser

  def initialize(json_response, browser)
    @json_response = json_response
    @browser = browser
  end

  def format_response
    if json_response["request"]["type"] == "LaunchRequest"
      launch_response = LaunchResponse.new(@browser)
      launch_response.render_response
    elsif json_response["request"]["type"] == "IntentRequest"
      IntentRequestHandler.new(json_response, @browser).route_intents
    end
  end
end
