pipeline {
    agent any

    environment {
	DOCKER_TAG = getVersion()
     }

  stages {
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
		withCredentials([string(credentialsId: 'mydockerhubpassword', variable:
	'DockerHubPassword')]) {
	sh 'docker login -u nour001 -p ${DockerHubPassword}'
	}
	sh 'docker push nour001/angular:${DOCKER_TAG}'
	}
     }
     
    stage ('Deploy') {
	steps{

	sshagent(credentials: ['Vagrant_ssh']) {
	
	sh 'docker pull nour001/angular:22ca9fb'
	sh 'docker run nour001/angular:22ca9fb'
	}
       }
}

   }
}

def getVersion(){
def version = sh returnStdout: true, script: 'git rev-parse --short HEAD'
return version
}



