#!/bin/bash

docker-compose down
if [[ -$? -eq 0 ]]; then
  echo "go-mall stop success"
  exit 0
else
  echo "go-mall stop failed"
  exit 1
fi
