require 'sinatra'
require 'json'
require 'pry'

class LaunchResponse
  def render_response
        {
      "version": "1.0",
      "sessionAttributes": {
        "key": "value"
      },
      "response": {
        "outputSpeech": {
          "type": "PlainText",
          "text": "Welcome to Recipe Friend, what would you like me to do?",
          "playBehavior": "REPLACE_ENQUEUED"
        },
        "card": {
          "type": "Simple",
          "title": "Response to a LaunchRequest",
        },
        "reprompt": {
          "outputSpeech": {
            "type": "PlainText",
            "text": "Are you still there?, You can ask to find a recipe or read recipe",
            "playBehavior": "REPLACE_ENQUEUED"
          }
        },
        "shouldEndSession": false
      }
    }.to_json
  end
end
