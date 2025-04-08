pipeline {
    agent any
    stages {
        stage('build') {
            agent {
              docker{
                image 'node:20-alpine'
                reuseNode true
              }
            }
            steps {
                sh ''' 
                  ls -al
                  node --version
                  npm --version
                  npm ci
                  npm run build
                  ls -al
                '''
            }
        }
        stage('test'){
            steps{
              sh 'echo "phase de test"'
              sh 'test -f dist/index.html'
            }
        }
    }
}