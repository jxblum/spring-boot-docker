FROM openjdk:17-oracle

ARG PORT=8080
ARG SPRING_PROFILE=A
ARG JAR_FILE=target/spring-boot-docker-0.0.1-SNAPSHOT.jar

RUN mkdir -p /user/codeprimate/spring/boot/docker
WORKDIR /user/codeprimate/spring/boot/docker
COPY ${JAR_FILE} .

EXPOSE ${PORT}

#CMD [ "java", "-server", "-ea", "-Dspring.profiles.active=${SPRING_PROFILE}", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar" ]
CMD [ "java", "-server", "-ea", "-Dspring.profiles.active=A", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar" ]
