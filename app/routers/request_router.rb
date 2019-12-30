require 'sinatra'
require 'json'
require 'pry'
require './app/responses/launch_response'
require './app/handlers/intent_request_handler'

class RequestRouter
  attr_reader :json_response

  def initialize(json_response)
    @json_response = json_response
  end

  def format_response
    if json_response["request"]["type"] == "LaunchRequest"
      launch_response = LaunchResponse.new
      launch_response.render_response
    elsif json_response["request"]["type"] == "IntentRequest"
      IntentRequestHandler.new(json_response).route_intents
    end
  end
end
