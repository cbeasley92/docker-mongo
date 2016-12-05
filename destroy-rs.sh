#!/bin/bash

docker stop mongo01
docker stop mongo02
docker stop mongo03

docker rm mongo01
docker rm mongo02
docker rm mongo03

docker network rm mongo-cluster

