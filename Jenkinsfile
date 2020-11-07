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

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', dockercreds ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
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
