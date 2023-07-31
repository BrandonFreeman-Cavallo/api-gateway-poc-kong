#!/usr/bin/env bash

dotnet new grpc -o GrpcTest -n GrpcTest.Docker
docker build -t grpc-test -f Dockerfile .
docker create --name grpc-test grpc-test:latest

