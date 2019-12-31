require 'sinatra'
require 'json'
require 'pry'
require './app/services/recipe_service'
require './app/formatters/message_formatter'

class IntentRequestHandler
  attr_reader :json_response

  def initialize(json_response)
    @json_response = json_response
  end

  def intent
    json_response["request"]["intent"]["name"]
  end

  def value
    json_response["request"]["intent"]["slots"]["name"]["value"]
  end

  def route_intents
    if intent == "find_recipe"
      recipe_service = RecipeService.new
      # recipe_service.find_recipes(value)
      message_formatter = MessageFormatter.new(recipe_service.find_recipes(value))
      message_formatter.format_find_recipe_message
    # elsif intent == "recipe"
    #   recipe_service = RecipeService.new
    # elsif intent = "step"
    #   recipe_service = RecipeService.new
    end
  end

end
