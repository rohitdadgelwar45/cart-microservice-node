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
                sh 'docker build -t eureka:2002 .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: '', usernameVariable: '')]) {
                sh 'Docker push eureka:2002'
                }
            }
        }
        
    }
}