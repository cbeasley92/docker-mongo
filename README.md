# docker-mongo
Dockerizing MongoDB

### Running MongoDB with Docker
docker run -p 28000:27017 -d cbeasley/mongodb:3.4

docker run -p 28001:27017 -d cbeasley/mongodb:3.4

docker run -p 28002:27017 -d cbeasley/mongodb:3.4

### Connecting to each MongoDB instance
mongo --port 28000

mongo --port 28001

mongo --port 28002
