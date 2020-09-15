pipeline {

agent {
        kubernetes {
            label 'build-service-pod'
            defaultContainer 'jnlp'
            yaml """
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
"""
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
            tools {nodejs "nodejs 14.10.1"}
            steps {
                container ('ubuntu'){
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm install -g serve'
                }
                }
        }
        stage('create image') {
            steps { 
                container('docker'){
                  sh 'docker images'
                  sh 'sleep 3000'
                }
            }
        }
    }
}
                  //  sh 'docker build --tag "image:build_${env.BUILD_ID}"'
  
