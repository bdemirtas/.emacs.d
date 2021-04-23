pipeline {
    agent any
    stages {
        stage('Building image') {
            steps{
                script {
                    checkout scm
                    def dockerImage = docker.build("emacs:${env.BUILD_ID}")
                    dockerImage.inside {
                        sh 'emacs -Q --batch -l /root/.emacs.d/init.el --funcall make-install-packages'
                    }
                }
            }
        }
    }
}
