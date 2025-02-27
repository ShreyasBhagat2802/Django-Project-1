pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'Terraform', url: 'https://github.com/ShreyasBhagat2802/Django-Project-1.git'
            }
        }
        stage('Setup Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

