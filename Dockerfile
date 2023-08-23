FROM openjdk:11-jre-slim
EXPOSE 9091
ADD target/ashu-app-docker.jar ashu-app-docker.jar
ENTRYPOINT [ "java","-jar","/ashu-app-docker.jar" ]
