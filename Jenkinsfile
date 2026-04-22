pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // On récupère le code depuis GitHub
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // On construit l'image Docker avec l'ID du build
                    sh "docker build -t webapp:${env.BUILD_ID} ."
                    sh "docker tag webapp:${env.BUILD_ID} webapp:latest"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // On déploie sur Kubernetes automatiquement
                    sh "kubectl apply -f deployment.yaml"
                    sh "kubectl apply -f service.yaml"
                }
            }
        }
    } 
}
