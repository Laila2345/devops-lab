pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t webapp:${env.BUILD_ID} ."
                    sh "docker tag webapp:${env.BUILD_ID} webapp:latest"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Correction de l'erreur TLS avec --insecure-skip-tls-verify
                    sh "kubectl apply -f deployment.yaml --insecure-skip-tls-verify=true"
                    sh "kubectl apply -f service.yaml --insecure-skip-tls-verify=true"
                    
                    // Vérifier que tout est déployé
                    sh "kubectl get pods --insecure-skip-tls-verify=true"
                    sh "kubectl get services --insecure-skip-tls-verify=true"
                }
            }
        }
    }
}
