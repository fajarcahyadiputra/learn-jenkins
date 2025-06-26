// pipeline {
//   agent any

//   environment {
//     IMAGE_NAME = 'goapp'
//     CONTAINER_NAME = 'goapp-container'
//   }

//   stages {
//     stage('Checkout') {
//       steps {
//         checkout scm
//       }
//     }

//     // stage('Build Docker Image') {
//     //   steps {
//     //     sh 'docker build -t ${IMAGE_NAME}:latest .'
//     //   }
//     // }

//     stage('Run App with Docker Compose') {
//       steps {
//         // Compose build to make sure it uses latest Dockerfile changes
//         sh 'docker compose up --build -d'
//       }
//     }

//     // stage('Test App') {
//     //   steps {
//     //     // Tambahkan delay kecil agar service sempat benar-benar ready
//     //     sh '''
//     //       echo "Testing service at http://localhost:5000/hello"
//     //       sleep 5
//     //       curl --retry 5 --retry-connrefused http://localhost:5000/hello
//     //     '''
//     //   }
//     // }
//   }

//   post {
//     always {
//       echo '🧹 Cleaning up containers...'
//     //   sh 'docker compose down || true'
//     }
//     success {
//       echo '✅ App built and deployed successfully.'
//     }
//     failure {
//       echo '❌ Something went wrong.'
//     }
//   }
// }
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

    stage('Get Git Tag') {
      steps {
        script {
          // Ambil tag jika commit sekarang adalah tag
          def rawTag = sh(script: 'git describe --tags --exact-match || echo latest', returnStdout: true).trim()
          def newTag = rawTag.replaceFirst(/^v/, "") 
          env.NEW_TAG = newTag
          echo "📝 Git Tag detected: ${env.NEW_TAG}"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          def imageWithTag = "${IMAGE_NAME}:${env.NEW_TAG}"
          sh "docker build -t ${imageWithTag} ."
          echo "🐳 Built Docker image: ${imageWithTag}"
        }
      }
    }

    stage('Run App with Docker Compose') {
      steps {
        script {
          // Kirim tag ke compose sebagai environment variable
          sh """
            IMAGE_TAG=${env.NEW_TAG} docker compose up --build -d
          """
        }
      }
    }

    stage('Test App') {
      steps {
        sh '''
          echo "🔍 Testing service at http://localhost:5000/hello"
          sleep 5
          curl --retry 5 --retry-connrefused http://localhost:5000/hello
        '''
      }
    }
  }

  post {
    always {
      echo '🧹 Cleaning up containers...'
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

