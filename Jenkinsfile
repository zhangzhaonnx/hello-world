#!/usr/bin/env groovy

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Build start"'
                sh './gradlew clean build'
                archiveArtifacts 'build/libs/*.jar'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Test start"'
                sh './gradlew clean test'
                publishHTML (target : [allowMissing: false,
                                       alwaysLinkToLastBuild: true,
                                       keepAll: true,
                                       reportDir: 'build/reports/tests',
                                       reportFiles: 'index.html',
                                       reportName: 'My Reports',
                                       reportTitles: 'The Report'])
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploy start"'
            }
        }
    }
}