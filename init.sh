#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if ! command -v docker &> /dev/null
then
    echo "Install Docker, my dude!"
    exit
fi

if ! command -v terraform &> /dev/null
then
    echo "Install Terraform, my dude!"
    exit
fi

if [ ! -d "./googleapis/google/api" ]; then
  echo "Updating git submodules"
  git submodule update --init --recursive
fi

if [[ "$(docker images -q web-client 2> /dev/null)" = "" ]]; then
  cd $SCRIPTPATH/WebClient
  pwd
  docker build -t web-client -f Dockerfile .
fi

if [[ "$(docker images -q http-test 2> /dev/null)" = "" ]]; then
  cd $SCRIPTPATH/HttpTest
  pwd
  docker build -t http-test -f Dockerfile .
fi

if [[ "$(docker images -q grpc-test 2> /dev/null)" = "" ]]; then
  cd $SCRIPTPATH/GrpcTest
  pwd
  
  if ! test -f "./google/api/annotations.proto"; then
    mkdir -p ./google/api
    cp ../googleapis/google/api/annotations.proto ./google/api/annotations.proto
  fi

  if ! test -f "./google/api/http.proto"; then
    mkdir -p ./google/api
    cp ../googleapis/google/api/http.proto ./google/api/http.proto
  fi

  docker build -t grpc-test -f Dockerfile .
fi

cd $SCRIPTPATH

docker compose down -v
docker compose up -d

cd $SCRIPTPATH/terraform

if test -f "./terraform.tfstate"; then
  rm terraform.tfstate*
fi

until curl -s -f -o /dev/null "http://localhost:8001/services"
do
  echo "Waiting for Kong to start ..."
  sleep 5
done

terraform apply -auto-approve
