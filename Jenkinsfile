pipeline {

    agent {
        kubernetes {
            label 'jenkins-ci-jenkins-slave'
            defaultContainer 'jnlp'
            yamlFile 'podTEMPLATE.yml'
        }
    }
    options {
        skipDefaultCheckout true
    }


    environment {
      registry = "naidadv/kuber_homework"
      registryCredential = 'doc-hub-cred'
    }

    stages {
        stage('build') {
            tools {nodejs "nodejs 14"}
            steps {
                container ('ubuntu'){
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                }
                }
        }
        stage('create image') {
            steps { 
                container('docker'){
                    sh 'ls'
                    git 'https://github.com/NaidaDV/test'
                    sh 'docker build -t "naidadv/kuber_homework:build_${env.BUILD_ID}" /home/jenkins/agent/workspace/Homework'
                    withDockerRegistry([ 'https://registry.hub.docker.com/', registryCredential ]) {
                        sh 'docker push "naidadv/kuber_homework:build_${env.BUILD_ID}"'
                    }
                }
            }
        }
    }
}
                  //  sh 'docker build --tag "image:build_${env.BUILD_ID}"'
  
