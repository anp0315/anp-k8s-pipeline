pipeline {
    agent any

    stages {

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
                sh '''
                kubectl delete job rf-test-job --ignore-not-found=true
                kubectl apply -f k8s/job.yaml
                '''
            }
        }

        stage('Get Logs') {
            steps {
                sh 'kubectl logs job/rf-test-job'
            }
        }
    }
}
