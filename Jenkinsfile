pipeline {
    agent any

    stages {

        stage('Check User') {
            steps {
                bat 'whoami'
                bat 'echo %USERPROFILE%'
                bat 'minikube profile list'
            }
        }

        stage('Check Minikube') {
            steps {
                bat 'where minikube'
                bat 'minikube version'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t rf-app:latest .'
            }
        }

        stage('Load Image to Minikube') {
            steps {
                bat 'minikube image load rf-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl delete job rf-test-job --ignore-not-found=true'
                bat 'kubectl apply -f k8s/job.yaml'
            }
        }

        stage('Get Logs') {
            steps {
                bat 'kubectl logs -l job-name=rf-test-job'
            }
        }
    }
}
