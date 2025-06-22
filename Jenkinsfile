pipeline {
    agent any
    tools{
        go 'go1.23'
    }

    environment{
        GO111MODULE 'on'
        // GOPATH '/go'
        // GOCACHE '/go/cache'
        // GOMODCACHE '/go/pkg/mod'
        // GOROOT '/usr/local/go'
        // PATH "${env.GOPATH}/bin:${env.GOROOT}/bin:${env.PATH}"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
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
