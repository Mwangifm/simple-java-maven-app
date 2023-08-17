FROM anapsix/alpine-java 
LABEL maintainer="francis.mwangi@strathmore.edu"
COPY /var/jenkins_home/workspace/simple-pipeline-1/target/my-app-1.0-SNAPSHOT.jar /home/my-app-1.0-SNAPSHOT.jar 
CMD ["java","-jar","/home/my-app-1.0-SNAPSHOT.jar"]