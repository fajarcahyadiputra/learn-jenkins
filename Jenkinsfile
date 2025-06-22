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

    // stage('Build Docker Image') {
    //   steps {
    //     sh 'docker build -t ${IMAGE_NAME}:latest .'
    //   }
    // }

    stage('Run App with Docker Compose') {
      steps {
        // Compose build to make sure it uses latest Dockerfile changes
        sh 'docker compose up --build -d'
      }
    }

    // stage('Test App') {
    //   steps {
    //     // Tambahkan delay kecil agar service sempat benar-benar ready
    //     sh '''
    //       echo "Testing service at http://localhost:5000/hello"
    //       sleep 5
    //       curl --retry 5 --retry-connrefused http://localhost:5000/hello
    //     '''
    //   }
    // }
  }

  post {
    always {
      echo '🧹 Cleaning up containers...'
    //   sh 'docker compose down || true'
    }
    success {
      echo '✅ App built and deployed successfully.'
    }
    failure {
      echo '❌ Something went wrong.'
    }
  }
}
