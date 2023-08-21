FROM openjdk:11-jre-slim
EXPOSE 9091
ADD target/sars-app-docker.jar sars-app-docker.jar
ENTRYPOINT [ "java","-jar","/sars-app-docker.jar" ]
