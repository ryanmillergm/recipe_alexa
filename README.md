# recipe_alexa

This project is a microservice for Recipe Friend
The app is deployed at http://recipehound.km6rdxpp4h.us-west-2.elasticbeanstalk.com/.

## Schema
![schema](./public/images/schema.png)

## Tech Stack
 - Framework: Sinatra
 - Language: Ruby
 - Database: PostgreSQL v7.12.1
 - Testing: RSpec

## Other Packages
 - Figaro
 - Faraday
 - Active Model Serializers v0.10.0

## Local Setup
 - `$ git clone https://github.com/ryanmillergm/recipe_friend.git`
 - `$ cd recipe_friend`
 - `$ bundle exec install`
 - `$ bundle exec rails db:create`
 - `$ bundle exec rails db:migrate`
 - `$ bundle exec rails db:seed`
 - `$ bundle exec figaro install`

## Additional steps
 -

## Running the Server Locally
 - `$ rails s`
 - Access local endpoints at `http://localhost:3000/ToBeDetermined`
 - Access deployed endpoints at `https://somewhere.com`

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
 - Alexa skill set to read recipes

## Known Issues
 - None
