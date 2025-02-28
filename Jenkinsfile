pipeline {
    agent any

    environment {
        TF_TOKEN_app_terraform_io = credentials('terraform-cloud-token')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'Terraform',  url: 'https://github.com/ShreyasBhagat2802/Django-Project-1.git'
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
                input message: "Proceed with Terraform Apply?"
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "Terraform deployment successful! ✅"
        }
        failure {
            echo "Terraform deployment failed. ❌"
        }
    }
}
