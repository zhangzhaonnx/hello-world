#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Build start"'
                sh './gradlew build -x test'
                archiveArtifacts 'build/libs/*.jar'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Test start"'
                sh './gradlew test'
            }

            post {
                always {
                    junit 'build/test-results/test/*.xml'
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