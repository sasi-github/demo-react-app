node('master') {
 
 stage('Start') {
  checkout scm
 }

 stage('Static Analysis') {
  //sh '~/.nvm/versions/node/v13.0.1/bin/npm install eslint && ~/.nvm/versions/node/v13.0.1/bin/npm run lint'
  sh npm run lint
  echo 'Passed Static Analysis'
 }

 stage('Unit Test') {
  //sh '~/.nvm/versions/node/v10.16.3/bin/npm test'
  sh npm run test
  echo 'Passed Unit Test'
 }

 stage('Build') {
  //sh "docker images"
  //sh "docker build . -t myreact-app:${BUILD_NUMBER}"
  //sh "docker images"
 }

  stage('Deployment') {
   //sh "docker ps -a"/   sh 'docker stop react-ui-container || exit 0'
   //sh 'docker kill react-ui-container || exit 0'
   //sh 'docker rm react-ui-container || exit 0'
   //sh "docker run --name react-ui-container -p 80:80 react-ui:${BUILD_NUMBER} &"
   //sh "docker restart react-ui-container"
   //sh "docker ps -a"
  }

}
