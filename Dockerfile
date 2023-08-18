FROM openjdk:8-jre-alpine3.9
LABEL maintainer="francis.mwangi@strathmore.edu"
COPY /target/my-app-1.0-SNAPSHOT.jar my-app-1.0.jar 
CMD ["java","-jar","my-app-1.0.jar"]