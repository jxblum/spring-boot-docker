#!/bin/bash

docker image build . -t codeprimate/spring-boot-app-a
docker image build . -t codeprimate/spring-boot-app-b
docker network create boot-net
docker container run --name skullbox --network boot-net -it -p 7070:7070 codeprimate/spring-boot-app-a
docker container run --name boombox --network boot-net -it -p 9090:9090 codeprimate/spring-boot-app-b
