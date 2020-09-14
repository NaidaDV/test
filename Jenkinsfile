pipeline {
    agent { 
        kubernetes { 
            yamlFile 'podTEMPLATE.yml' 
        } 
    }
    
    tools {
        nodejs "nodejs 14"
    }

    stages {
        stage ('Build artifact') {
            steps {
                container('docker') {
                    git 'https://github.com/americans007/react-app'
                    
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        
        stage ('Build image') {
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
