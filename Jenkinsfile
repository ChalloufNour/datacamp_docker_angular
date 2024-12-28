pipeline {
    agent any

    environment {
	DOCKER_TAG = getVersion()
     }


    stage ('Clone Stage') {
      steps {
	git https://github.com/ChalloufNour/datacamp_docker_angular.git
	}
    }
    
    stage ('Docker Build') {
	steps {
	  sh 'docker build -t ChalloufNour/angular:${DOCKER_TAG}.'
	}
     }
     
     stage ('DockerHub Push') {
	steps {
	  sh 'sudo docker login –u username –p password'
          sh 'sudo docker push nour001/angular:${DOCKER_TAG}'
         }
        }
   }

def getVersion(){
def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
return version
}



