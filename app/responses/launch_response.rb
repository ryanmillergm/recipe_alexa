require 'sinatra'
require 'json'
require 'pry'
require 'watir'
require "selenium-webdriver"

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'

class LaunchResponse
  attr_reader :browser

  def initialize(browser)
    @browser = browser
  end

  def launch_recipe_friend
    @browser.goto("localhost:3000")
    # @browser.get "localhost:3000"
  end

  def render_response
      launch_recipe_friend
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
