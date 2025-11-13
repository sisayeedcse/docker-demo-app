pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the app...'
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'echo "mock test passed"'
            }
        }

        stage('Package') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t demo-app:latest .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying app with Docker Compose...'
                sh 'docker-compose up -d'
            }
        }

        stage('Health Check') {
            steps {
                echo 'Checking app health...'
                sh './healthcheck.sh'
            }
        }
    }
}
