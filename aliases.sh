#!/bin/bash

MONGO_CONTAINER_NAME=mongo
alias mongo_start="docker run -dP -p 27017:27017 --name=$MONGO_CONTAINER_NAME mongo:2.6.7"
alias mongo_stop="docker rm -vf $MONGO_CONTAINER_NAME"

APIGEE_CONTAINER_NAME=apigee
alias apigee_start="docker run -dP -p 18080:8080 -p 19000:9000 -p 19001:9001 --name=$APIGEE_CONTAINER_NAME docker-registry.cloud.platforms.gamesys.corp/coreplatform/apigee:current"
alias apigee_stop="docker rm -vf $APIGEE_CONTAINER_NAME"

alias docker_clean='docker rm -vf $(docker ps -aq)'
