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

   stage('sonarqube') {
            docker.image('newtmitch/sonar-scanner').inside('-v /var/run/docker.sock:/var/run/docker.sock --entrypoint="" --net jenkins_jenkins') {
            sh "/usr/local/bin/sonar-scanner -Dsonar.host.url=https://sonarcloud.io -Dsonar.sources=/var/lib/jenkins/workspace/sample-spring-boot -Dsonar.projectBaseDir=/var/lib/jenkins/workspace/sample-spring-boot -Dsonar.projectKey=mobey123 -Dsonar.login=41ee7b87c4a67889d1cfac416339c02cf4b4aca1 -Dsonar.verbose=true"
        }
        }
    stage('docker build') {
      agent {
        docker {
          image 'busybox'
        }

      }
      steps {
        sh 'echo docker build'
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
