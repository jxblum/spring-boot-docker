FROM openjdk:17-oracle

ARG PORT=8080
ARG SPRING_PROFILE="-Dspring.profiles.active=A"
ARG JAR_FILE=target/spring-boot-docker-0.0.1-SNAPSHOT.jar

RUN mkdir -p /user/codeprimate/spring/boot/docker
WORKDIR /user/codeprimate/spring/boot/docker
COPY ${JAR_FILE} .

EXPOSE ${PORT}

CMD [ "java", "-server", "-ea", "${SPRING_PROFILE}", "-jar", "spring-boot-docker-0.0.1-SNAPSHOT.jar" ]
