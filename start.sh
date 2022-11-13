#!/bin/bash

docker exec -it go-mall_golang_1 bash -c './nivin install && ./nivin start rpc user && ./nivin start api user'

if [[ "$?" == 0 ]]; then
  echo "go-mall start success"
else
  echo "go-mall start failed"
fi
