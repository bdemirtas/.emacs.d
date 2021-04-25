void setBuildStatus(String message, String state) {
    step([
    $class: "GitHubCommitStatusSetter",
    reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/bdemirtas/.emacs.d"],
    contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
    errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
    statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
    ]);
}

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
    post {
        success {
            setBuildStatus("Build succeeded", "SUCCESS");
        }
        failure {
            setBuildStatus("Build failed", "FAILURE");
        }
    }
}
