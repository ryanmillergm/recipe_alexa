require 'sinatra'
require 'json'

post '/' do
  {
    version: "1.0",
    response: {
      outputSpeech: {
        type: "PlainText",
        text: "Welcome to recipe friend"
      }
    }
  }.to_json
end
