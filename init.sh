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

if ! test -f "./GrpcTest/google/api/annotations.proto"; then
  mkdir -p ./GrpcTest/google/api
  cp ./googleapis/google/api/annotations.proto ./GrpcTest/google/api/annotations.proto
fi

if ! test -f "./GrpcTest/google/api/http.proto"; then
  mkdir -p ./GrpcTest/google/api
  cp ./googleapis/google/api/http.proto ./GrpcTest/google/api/http.proto
fi

docker compose down -v
docker compose up -d --build

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
