pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        REGION = 'eu-west-1'
        TF_CLOUD_TOKEN = credentials('TERRAFORM_CLOUD_TOKEN')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'Terraform', url: 'https://github.com/ShreyasBhagat2802/Django-Project-1.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                sh '''
                echo $TF_CLOUD_TOKEN > ~/.terraform.d/credentials.tfrc.json
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment successful! ✅'
        }
        failure {
            echo 'Terraform deployment failed. ❌'
        }
    }
}
