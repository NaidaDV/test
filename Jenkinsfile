pipeline {
    agent {
        kubernetes {
            yamlFile 'yaml-conf-for-kubernetes-plugin.yml'
        }
    }

    tools {
        nodejs "nodejs 14.10.1"
        docker "docker"
    }

    stages {
        stage('Build artifact') {
            steps {
                container('shell') {
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                script {
                docker.build("image:build_${env.BUILD_ID}", ".")
                    
                sh 'sleep 3000'
                    }
                }
            }
        }
    }
}
