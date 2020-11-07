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
          docker.withRegistry( '', registryCredential  ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    

  stage('app deploy') {
    agent {
       kubernetes {
      	cloud 'kubernetes'
        defaultContainer 'jnlp'

      }
    }
        steps {
        script {
          kubernetesDeploy(configs: "kubernetes.yml", kubeconfigId: "MINIKUBECONFIG")
        }
      }
    }
    
     

  }
}
