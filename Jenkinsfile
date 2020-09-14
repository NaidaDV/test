pipeline {
    agent none
    tools {
        nodejs "nodejs 14"
    }

    stages {
        stage('Build artifact') {
            steps {
                    git 'https://github.com/americans007/react-app'
                    sh 'npm install'
                    sh 'npm run build'
            }
        }
        
        stage('Build image') {
            kubernetes { yamlFile 'podTEMPLATE.yml' }
            steps {
                container('docker') {
                    sh 'docker build --tag "image:build_${env.BUILD_ID}"'
                    // sh 'sleep 3000'
                    sh 'docker images'
                }
            }
        } 
    }
}
