#!/usr/bin/env bash

docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate

docker-compose up -d