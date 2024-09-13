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
                sh 'docker build -t eureka .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'Docker-Hub-Pass', variable: 'Password'), string(credentialsId: 'Docker-Hub-ID', variable: 'Username')]) {
                sh 'docker push eureka'
                }
            }
        }
        
    }
}