pipeline {
    agent any

    tools {
        go 'go1.23'
    }

    environment {
        GO111MODULE = 'on'
        // GOPATH, GOROOT, etc bisa diatur otomatis jika pakai `tools { go '...' }`
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'go version'
                sh 'go build ./...'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'go test ./...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Tambahkan skrip deploy di sini
            }
        }
    }

    post {
        always {
            echo 'This will always run after the stages.'
        }
        success {
            echo 'This will run only if the pipeline is successful.'
        }
        failure {
            echo 'This will run only if the pipeline fails.'
        }
        unstable {
            echo 'This will run if the pipeline is marked as unstable.'
        }
        changed {
            echo 'This will run if the pipeline status has changed from the previous run.'
        }
        aborted {
            echo 'This will run if the pipeline is aborted.'
        }
        cleanup {
            echo 'This will run for cleanup tasks after the pipeline execution.'
        }
    }
}
