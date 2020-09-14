pipeline {
    agent { 
        kubernetes { 
            yamlFile 'podTEMPLATE.yml'
            defaultContainer 'ubuntu'
        } 
    }
    
    tools {
        nodejs "nodejs 14"
    }
    
    stages {
        node(POD_LABEL) {
        stage ('Build artifact') {
            steps {
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
