pipeline {

    agent {
        kubernetes {
            label 'build-service-pod'
            defaultContainer 'jnlp'
            yaml '''
apiVersion: v1
kind: Pod
metadata:
  labels:
    job: build-service
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["cat"]
    tty: true
    volumeMounts:
    - name: repository
      mountPath: /root/.m2/repository
  - name: docker
    image: docker:18.09.2
    command: ["cat"]
    tty: true
    volumeMounts:
    - name: docker-sock
      mountPath: /var/run/docker.sock
  volumes:
  - name: repository
    persistentVolumeClaim:
      claimName: repository
  - name: docker-sock
    hostPath:
      path: /var/run/docker.sock
'''
        }
    }
    options {
        skipDefaultCheckout true
    }

    tools {
        nodejs "nodejs 14.10.1"
    } 
    
    environment {
      registry = "naidadv/kuber_homework"
      registryCredential = 'doc-hub-cred'
    }

    stages {
        stage('build') {
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
                    sh "docker build -t 'naidadv/kuber_homework:build_${env.BUILD_ID}' /home/jenkins/agent/workspace/homework"
                    withDockerRegistry([ credentialsId: "doc-hub-cred", url: "" ]) {
                    sh 'docker push "naidadv/kuber_homework:build_${env.BUILD_ID}"'
                    }
                }
            }
        }
    }
}
                  //  sh 'docker build --tag "image:build_${env.BUILD_ID}"'
  
