pipeline {
  agent any

  environment {
    DEV_IMAGE = 'prasanna1808/dev:latest'
    PROD_IMAGE = 'prasanna1808/prod:latest'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        script {
          env.BRANCH_NAME = env.GIT_BRANCH.replaceAll('origin/', '')
          echo "Current branch: ${env.BRANCH_NAME}"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh 'chmod +x build.sh'
          sh "./build.sh ${env.BRANCH_NAME}"
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          script {
            sh """
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            """

            if (env.BRANCH_NAME == "dev") {
              sh "docker push $DEV_IMAGE"
            } else if (env.BRANCH_NAME == "main") {
              sh "docker push $PROD_IMAGE"
            } else {
              echo "Not a dev or main branch. Skipping push."
            }
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        sshagent (credentials: ['ec2-ssh']) {
          sh 'chmod +x deploy.sh'
          sh "./deploy.sh ${env.BRANCH_NAME}"
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
    }
  }
}

