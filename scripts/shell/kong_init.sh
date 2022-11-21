#!/bin/bash

docker run --rm --network=backend \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_PASSWORD=kong" \
  -e "KONG_PASSWORD=admin" \
 kong/kong-gateway:3.0.1.0 kong migrations bootstrap
