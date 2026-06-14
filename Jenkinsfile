pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'YOUR_GITHUB_REPO_URL'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rf-app:latest .'
            }
        }

        stage('Load Image to Minikube') {
            steps {
                sh 'minikube image load rf-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl delete job rf-test-job --ignore-not-found=true'
                sh 'kubectl apply -f k8s/job.yaml'
            }
        }

        stage('Get Logs') {
            steps {
                sh '''
                sleep 10
                kubectl logs job/rf-test-job
                '''
            }
        }
    }
}