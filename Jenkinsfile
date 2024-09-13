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
                sh 'docker build -t rohitdadgelwar/eureka .'
            }
        }
        stage('Push Docker Image') {
            steps {
                   withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/rohitdadgelwar/eureka/general') {
                    sh 'git push rohitdadgelwar/eureka'
                   }
            }

        }
    }
        
    
}