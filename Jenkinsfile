#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Build start"'
                sh './gradlew clean build'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Test start"'
                sh './gradlew clean test'
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
            archiveArtifacts 'build/libs/*.jar'
//            junit 'build/reports/**/*.xml'
        }
    }
}