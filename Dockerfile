FROM openjdk:17-oracle

ARG HOST=skullbox
#ARG HOST=boombox
ARG PORT=7070
#ARG PORT=9090
ARG SPRING_PROFILE=A
#ARG SPRING_PROFILE=B
ARG JAR_FILE=target/spring-boot-docker-0.0.1-SNAPSHOT.jar

RUN mkdir -p /user/codeprimate/spring/boot/docker
WORKDIR /user/codeprimate/spring/boot/docker
COPY ${JAR_FILE} .

EXPOSE ${PORT}

#CMD [ "java", "-server", "-ea", "-Dspring.profiles.active=${SPRING_PROFILE}", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar" ]
CMD [ "java", "-server", "-ea", "-Dspring.profiles.active=A", "-Dremote.server.hostname=boombox", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar" ]
