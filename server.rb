require 'sinatra'
require 'json'
require 'net/http'
require 'pry'
require './routers/request_router'

post '/' do
  p request.body.read
  launch_response = RequestRouter.new(JSON.parse(request.body.read))
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
