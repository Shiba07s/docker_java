FROM openjdk:11-jre-slim
EXPOSE 9091
ADD target/student-app-docker.jar student-app-docker.jar
ENTRYPOINT [ "java","-jar","/student-app-docker.jar" ]
