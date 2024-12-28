pipeline {
    agent any

    environment {
	DOCKER_TAG = getVersion()
     }


    stage ('Clone Stage') {
      steps {
	git branch: 'main', url: 'https://github.com/ChalloufNour/datacamp_docker_angular.git'
	}
    }
    
    stage ('Docker Build') {
	steps {
	  sh 'docker build -t nour001/angular:${DOCKER_TAG} .'
	}
     }
     
     stage ('DockerHub Push') {
	steps {
	  sh 'sudo docker login –u nour001 –p dockerhubnour'
          sh 'sudo docker push nour001/angular:${DOCKER_TAG}'
         }
        }
   }

def getVersion(){
def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
return version
}



