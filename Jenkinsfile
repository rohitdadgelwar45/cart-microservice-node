pipeline{
    agent any
    stages{
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rohitdadgelwar45/cart-microservice-node.git']])
            }
        }
    }
}