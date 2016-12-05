#!/bin/bash

docker network create mongo-cluster

docker run -d -p 30001:27017 --name mongo01 --net mongo-cluster cbeasley92/mongodb:3.4 --replSet "rs0"
docker run -d -p 30002:27017 --name mongo02 --net mongo-cluster cbeasley92/mongodb:3.4 --replSet "rs0"
docker run -d -p 30003:27017 --name mongo03 --net mongo-cluster cbeasley92/mongodb:3.4 --replSet "rs0"

docker exec mongo01 mongo --eval "printjson(rs.initiate())"
docker exec mongo01 mongo --eval "printjson(rs.conf())"
docker exec mongo01 mongo --eval "printjson(rs.add(\"mongo02:27017\"))"
docker exec mongo01 mongo --eval "printjson(rs.add(\"mongo03:27017\"))"
docker exec mongo01 mongo --eval "printjson(rs.status())"

