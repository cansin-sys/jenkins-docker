#!groovy

pipeline {
	agent { dockerfile true }
  stages {
  	stage('Create Docker File') { 
      steps {
      	sh 'hostname'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t dockercansin/ubuntu_cansin:latest .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push dockercansin/ubuntu_cansin:latest'
        }
      }
    }
  }
}
