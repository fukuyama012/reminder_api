#!/usr/bin/env bash

docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
# build front end client
docker-compose run --rm --workdir="/myapp/client" app yarn build

docker-compose up -d