pipeline {
    agent any
    
    tools {
        nodejs "nodejs 14"
    }
    
    stages {
        
        stage ('Build artifact') {
            steps { 
                kubernetes.pod('buildpodubuntu').withImage('ubuntu').inside {
                    git 'https://github.com/americans007/react-app'
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        
        stage ('Build image') {
            steps {
                kubernetes.pod('buildpoddocker').withImage('docker').inside {
                    sh 'docker build --tag "image:build_${env.BUILD_ID}"'
                    // sh 'sleep 3000'
                    sh 'docker images'
                }
            }
        }
    }
}
