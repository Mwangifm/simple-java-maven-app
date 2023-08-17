pipeline {
    agent {
        docker {
            image 'maven:3.9.3-eclipse-temurin-17-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
        stage('Docker Push') {
    	    agent any
            steps {
      	        withCredentials([usernamePassword(credentialsId: 'Docker', passwordVariable: 'Ngaietha2023', usernameVariable: 'mwangifm')]) {
        	    sh "docker login -u ${env.DockerUser} -p ${env.DockerPassword}"
                sh 'docker push hello-world:latest'
        }
      }
    }
}
}