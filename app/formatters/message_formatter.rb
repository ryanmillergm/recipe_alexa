require 'sinatra'
require 'json'
require 'pry'
require 'active_support/core_ext/integer/inflections'
require 'watir'
require "selenium-webdriver"

class MessageFormatter
  attr_reader :message_data, :browser

  def initialize(message_data, browser)
    @message_data = message_data
    @browser = browser
  end

  def count_results
    @message_data[:data].count
  end

  def recipe_results
    (1..count_results).map do |num|
      "The #{num.ordinalize} recipe is for #{@message_data[:data][num - 1][:attributes][:title]}. #{@message_data[:data][num - 1][:attributes][:description]}"
    end
  end

  def search_browser_for_recipe
    @browser.goto("http://localhost:3000/recipes?utf8=%E2%9C%93&q=#{@message_data[:data].first[:attributes][:title]}&commit=Search+Recipes")
    # @browser.get "http://localhost:3000/recipes?utf8=%E2%9C%93&q=#{@message_data[:data].first[:attributes][:title]}&commit=Search+Recipes"
  end

  def format_find_recipe_message
    search_browser_for_recipe
    message = recipe_results
      {
      "version": "1.0",
      "sessionAttributes": {
        "key": "value"
      },
      "response": {
        "outputSpeech": {
          "type": "PlainText",
          "text": "I found #{count_results}. #{recipe_results}",
          "playBehavior": "REPLACE_ENQUEUED"
        },
        "card": {
          "type": "Simple",
          "title": "Response to a LaunchRequest",
          # "text": "Text content for a standard card",
          # "image": {
          #   "smallImageUrl": "https://url-to-small-card-image...",
          #   "largeImageUrl": "https://url-to-large-card-image..."
          # }
        },
        "reprompt": {
          "outputSpeech": {
            "type": "PlainText",
            "text": "Would you like me to select a recipe? If so, say Alexa, select a recipe for me. Or you can say select first, second or whichever recipe you wish.",
            "playBehavior": "REPLACE_ENQUEUED"
          }
        },
        # "directives": [
        #   {
        #     "type": "InterfaceName.Directive"
        #     (...properties depend on the directive type)
        #   }
        # ],
        "shouldEndSession": false
      }
    }.to_json
  end

end
