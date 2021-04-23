pipeline {
    agent any
    environment {
        registry = "burakdemirtas/emacs"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Building image') {
            steps{
                checkout scm
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Running Package') {
            agent {
                docker {
                    args '-u root'
                    image registry
                }
            }
            steps{
                sh 'emacs --debug-init --batch -u root'
            }
        }
    }
}
