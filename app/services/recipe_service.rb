require 'sinatra'
require 'json'
require 'pry'
require 'faraday'

class RecipeService
  def conn
    Faraday.new(url: 'http://localhost:3000') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_recipes(food)
    parsed_response(conn.get("/api/v1/recipes/#{food.gsub(/[ ]/, '%20')}"))
  end
end
