#!/usr/bin/env bash

# rails api mode
docker-compose run --rm app rails new . --force --api -d mysql --skip-bundle -T

# copy config
cp -f config/myapp/database.yml myapp/config/database.yml
cp -f config/myapp/application.rb myapp/config/application.rb 
cp -f config/myapp/Gemfile myapp/Gemfile

# rspec-rails, factory_bot_rails
docker-compose run --rm app bundle install 

# node_modules
docker-compose run --rm --workdir="/myapp/client" app yarn install

docker-compose build
