FROM centos:7
MAINTAINER Clinton Beasley cbeasley92@gmail.com

# Installation:
# Import MongoDB public GPG key and create MongoDB list file
# RUN rpm --import https://docs.mongodb.com/10gen-gpg-key.asc
# RUN curl -O https://repo.mongodb.org/yum/redhat/mongodb-org.repo 
# RUN mv mongodb-org.repo /etc/yum.repos.d/
RUN echo $'[mongodb-org-3.4]\n\
name=MongoDB Repository\n\
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc\n'\
>> /etc/yum.repos.d/mongodb-org-3.4.repo

RUN yum update
RUN yum install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port 27017 from the container to the host
EXPOSE 27017

# Set /usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]
