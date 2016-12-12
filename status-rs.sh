#!/usr/bin/env bash

docker ps | grep mongo01
docker ps | grep mongo02
docker ps | grep mongo03

docker exec mongo01 mongo --eval "printjson(rs.status())"
