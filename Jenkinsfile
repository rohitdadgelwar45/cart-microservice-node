pipeline{
    agent any
    tools{
        maven "maven"
    }
    environment{
        DOCKERHUB_CREDENTIAL=credentials('Dockerhub')
    }
    stages{
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rohitdadgelwar45/cart-microservice-node.git']])
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rohitdadgelwar/eureka:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'Password', usernameVariable: 'Username')]) {
                sh 'docker push rohitdadgelwar/eureka'
                }
            }
        }
        
    }
}