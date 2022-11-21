#!/bin/bash

GOLANG_CONTAINER_NAME="go-mall_golang_1"
KONG_CONTAINER_NAME="go-mall_kong_1"
PROJECT_DIR="/root/workspace/golang/src/go-mall"

cd ${PROJECT_DIR} && docker-compose up -d
if [[ -$? -ne 0 ]]; then
  echo "docker compose up failed"
  exit 1
fi

# 初始化 kong-gateway 的数据
docker container ls |grep ${KONG_CONTAINER_NAME}
if [[ -$? -ne 0 ]]; then
  echo "docker container: ${KONG_CONTAINER_NAME} is not exist"
  exit 1
fi

bash ./init/kong-gateway.sh
if [[ -$? -eq 0 ]]; then
  echo "kong init success"
  exit 0
else
  echo "kong init failed"
  exit 1
fi

# 启动项目
docker container ls |grep ${GOLANG_CONTAINER_NAME}
if [[ -$? -ne 0 ]]; then
  echo "docker container: ${GOLANG_CONTAINER_NAME} is not exist"
  exit 1
fi

docker exec -it ${GOLANG_CONTAINER_NAME} bash -c './nivin install && ./nivin start rpc user && ./nivin start api user'

if [[ -$? -eq 0 ]]; then
  echo "go-mall start success"
  exit 0
else
  echo "go-mall start failed"
  exit 1
fi