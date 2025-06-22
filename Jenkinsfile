pipeline {
  agent any
  environment {
    IMAGE_NAME = 'goapp'
    CONTAINER_NAME = 'goapp-container'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Go App into Docker Image') {
      steps {
        sh 'docker build -t ${IMAGE_NAME}:latest .'
      }
    }

    stage('Run App with Docker Compose') {
      steps {
        sh 'docker compose up -d'
      }
    }

    stage('Test App') {
      steps {
        sh 'curl --retry 5 --retry-connrefused http://localhost:8080'
      }
    }
  }

  post {
    always {
      echo 'Cleaning up...'
      sh 'docker compose down || true'
    }
    success {
      echo '✅ App built and deployed successfully.'
    }
    failure {
      echo '❌ Something went wrong.'
    }
  }
}
