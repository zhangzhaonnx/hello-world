#!/usr/bin/env groovy

pipeline {
    agent any

    triggers {
        pollSCM('H/1 * * * *')
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
                sh 'echo "Deploy start"'
            }
        }
    }

    post {
        always {
            sh './gradlew clean'
        }
    }
}