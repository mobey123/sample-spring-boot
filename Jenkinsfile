pipeline {
  agent none
  environment {
    registry = "jajapaul/spring-boot"
    registryCredential = 'dockercreds'
    dockerImage = ''
    }
  stages {
    stage('build') {
      agent {
        docker {
          image 'gradle'
        }

      }
      steps {
        sh 'chmod +x gradlew && ./gradlew build'
      }
    }

    stage('docker build') {
     
      steps {
       docker.build registry + ":1.0"
      }
    }

   

    stage('app deploy') {
      agent {
        docker {
          image 'busybox'
        }

      }
      steps {
        sh 'echo kube deploy'
      }
    }

  }
}
