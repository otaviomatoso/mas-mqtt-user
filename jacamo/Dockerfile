# DOCKERFILE FOR JACAMO APP

# to build:
#    ./gradlew clean compileJava copyToLib
#    docker build -t jacamo/mqtt_telegram .

FROM alpine

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN apk add --update --no-cache openjdk8-jre bash

COPY . /app/

EXPOSE 3271
EXPOSE 3272
EXPOSE 3273
EXPOSE 8080

WORKDIR /app

CMD ["java", "-cp", "build/classes/java/main:build/libs/*","jacamo.infra.JaCaMoLauncher", "src/jcm/main.jcm"]
