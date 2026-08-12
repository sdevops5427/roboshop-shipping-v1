pipeline {

    agent any

    stages {
        stage('CheckOut') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sdevops5427/roboshop-shipping-v1.git'
            }
        }
        stage('ECR Login') {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 012751250483.dkr.ecr.us-east-1.amazonaws.com"
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t 012751250483.dkr.ecr.us-east-1.amazonaws.com/shipping ."
            }
        }
        stage('Push Image') {
            steps {
                sh "docker push 012751250483.dkr.ecr.us-east-1.amazonaws.com/shipping"
            }
        }
    }
}