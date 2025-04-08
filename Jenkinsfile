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
            step{
              sh 'test -f build/index.html'
            }
        }
    }
}