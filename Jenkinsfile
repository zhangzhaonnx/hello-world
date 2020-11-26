#!/usr/bin/env groovy

pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Build') {
            steps {
                sh './gradlew build'
            }

            post {
                always {
                    junit 'build/test-results/test/*.xml'
                    archiveArtifacts 'build/libs/*.jar'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t hello-app:1.0 .'
                sh 'docker rm -f hello-app'
                sh 'docker run -d --rm --name hello-app -p 8080:8080 hello-app:1.0'
            }
        }
    }

    post {
        always {
            sh './gradlew clean'
        }
    }
}