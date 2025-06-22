pipeline {
  agent {
    docker {
      image 'golang:1.23'
    }
  }

  environment {
    GO111MODULE = 'on'
  }

  stages {
    stage('Build') {
      steps {
        sh 'go version'
        sh 'go build ./...'
      }
    }

    stage('Test') {
      steps {
        sh 'go test ./...'
      }
    }
  }
}
