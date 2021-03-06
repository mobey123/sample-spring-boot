FROM openjdk:8u212-alpine

LABEL name "Springboot base image" 
LABEL maintainer "Cognizant"
LABEL version=1.0

USER root

ENV APP_LOC="/usr/src/app"


COPY build/libs/spring-boot-0.0.1-SNAPSHOT.jar $APP_LOC/app.jar
WORKDIR $APP_LOC

ENTRYPOINT ["java","-jar","app.jar"]
