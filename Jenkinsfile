pipeline {

    agent {
        kubernetes {
            label 'build-service-pod'
            defaultContainer 'jnlp'
            yamlFile 'podTEMPLATE.yml'
        }
    }
    options {
        skipDefaultCheckout true
    }


  //  environment {
 //     registry = "mariiamarkina/devopshomework"
  //    registryCredential = 'dockerhubCred'
 //     dockerImage = ""
  //  }

    stages {
        stage('build') {
            tools {nodejs "nodejs"}
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
                    git 'http://github.com/MariiaMarkina/KubernetesHmv'
                    sh 'docker build -t mariiamarkina/devopshomework:kubepipeline /home/jenkins/agent/workspace/Homework'
                    withDockerRegistry([ credentialsId: "dockerhubCred", url: "https://registry.hub.docker.com/" ]) {
                        sh 'docker push  mariiamarkina/devopshomework:kubepipeline'
                    }
                }
            }
        }
    }
}
                  //  sh 'docker build --tag "image:build_${env.BUILD_ID}"'
  
