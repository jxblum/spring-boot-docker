#!/bin/bash

docker image build . -t codeprimate/spring-boot-app-a
docker image build . -t codeprimate/spring-boot-app-b
docker container run -it -h skullbox -p 7070:7070 --name spring-boot-app-a codeprimate/spring-boot-app-a
docker container run -it -h boombox -p 9090:9090 --name spring-boot-app-b codeprimate/spring-boot-app-b
