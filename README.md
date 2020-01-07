# recipe_alexa

This project is a microservice for Recipe Friend. The Recipe Friend project can be found at https://github.com/ryanmillergm/recipe_friend. Recipe_alexa is a microservice that handles requests from a custom alexa skill and depending on the request, sends a request to the recipe friend api and responds back to alexa so users can use voice commands to find recipes. This microservice uses ngrok to tunnel request from alexa to recipe_alexa.

# commands
 - "Alexa, run recipe friend" - Awakes Alexa and opens the recipe friend website in chrome.
 - "Alexa, find me a recipe for <recipe>" - Finds a recipe from the recipe friend site.

The app is deployed at http://recipehound.km6rdxpp4h.us-west-2.elasticbeanstalk.com/.

## Schema
 - None

## Tech Stack
 - Framework: Sinatra
 - Language: Ruby
 - Testing: RSpec

## Other Packages
 - Ngrok
 - Faraday
 - Watir
 - selenium-webdriver

## Local Setup
 - `$ git clone https://github.com/ryanmillergm/recipe_alexa.git`
 - `$ cd recipe_alexa`
 - `$ bundle exec install`

## Additional steps
 - Sign up with ngrok. https://dashboard.ngrok.com/get-started

## Running the Server Locally
 - `$ ruby server.rb`
 - `$ ./ngrok authtoken <your_ngrok_token`

## Running the Test Suite
 - `$ rspec`

## API Endpoints
 - None as of now...

## Core Contributors
 - Ryan Miller, [@ryanmillergm](https://github.com/ryanmillergm)

### How to Contribute
 - Fork and clone the [repo](https://github.com/ryanmillergm/recipe_friend.git)
 - Make changes on your fork & push them to GitHub
 - Visit https://github.com/ryanmillergm/recipe_friend and click `New pull request`
 
## Current Iterations
 - Using Alexa to navigate recipe friend website.

## Known Issues
 - Currently using Watir to open and navigate website. Needs permanent solution for navigation.
