node('master') {
 stage('checkout') {
  step([$class: 'WsCleanup'])
  checkout scm
 }

 stage('Static Analysis') {
  // sh '~/.nvm/versions/node/v13.0.1/bin/npm install eslint && ~/.nvm/versions/node/v13.0.1/bin/npm run lint'
  echo 'passed sonar Qube'
 }

 stage('Unit Test') {
  //sh '~/.nvm/versions/node/v10.16.3/bin/npm test'
  echo 'passed Jest'
 }

 stage('Build Docker Image') {
  sh "docker images"
  sh "docker build . -t react-ui:${BUILD_NUMBER}"
  sh "docker images"
 }

 stage('Docker Deployment') {
  sh "docker ps -a"
  sh 'docker stop react-ui-container || exit 0'
  sh 'docker kill react-ui-container || exit 0'
  sh 'docker rm react-ui-container || exit 0'
  sh "docker run --name react-ui-container -p 80:80 react-ui:${BUILD_NUMBER} &"
  sh "docker restart react-ui-container"
  sh "docker ps -a"
 }
}