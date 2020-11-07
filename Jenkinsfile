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

    stage('sonarqube') {
      agent {
        docker {
          image 'newtmitch/sonar-scanner'
          args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""'
        }

      }
      steps {
        sh '''/usr/local/bin/sonar-scanner -Dsonar.host.url=https://sonarcloud.io -Dsonar.sources=/var/jenkins_home/workspace/sample-spring-boot_master -Dsonar.projectBaseDir=/var/jenkins_home/workspace/sample-spring-boot_master -Dsonar.projectKey=mobey123_sample-spring-boot -Dsonar.login=41ee7b87c4a67889d1cfac416339c02cf4b4aca1 -Dsonar.verbose=true -Dsonar.projectName=sample-spring-boot -Dsonar.sourceEncoding=UTF-8 -Dsonar.sources=src
 '''
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
          docker.withRegistry( '', registryCredential  ) {
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
