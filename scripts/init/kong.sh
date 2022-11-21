#!/bin/bash

KONG_DATABASE="postgres"
KONG_PG_HOST="kong-database"
KONG_PG_PASSWORD="kong"
KONG_PASSWORD="admin"

kong migrations bootstrap
