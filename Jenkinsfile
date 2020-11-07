pipeline {
  agent none
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
      agent {
        docker {
          image 'docker'
        }

      }
      steps {
        sh 'docker build -t jajapaul/spring-boot:1.0 .'
      }
    }

    stage('docker push') {
      agent {
        docker {
          image 'busybox'
        }

      }
      steps {
        sh 'echo docker push'
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
