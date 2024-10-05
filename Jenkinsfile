pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'static-ci-jenkins'
        DOCKER_CONTAINER = 'static-ci-jenkins-container'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ShubhamTiwary914/static-ci-jenkins.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} -f Dockerfile ."
            }
        }
        
        stage('Run Docker Container') {
            steps {
                sh "docker stop ${DOCKER_CONTAINER} || true"
                sh "docker rm ${DOCKER_CONTAINER} || true"
                sh "docker run -d -p 80:80 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}"
            }
        }
    }
    
    post {
        failure {
            echo 'Pipeline failed'
        }
    }
}