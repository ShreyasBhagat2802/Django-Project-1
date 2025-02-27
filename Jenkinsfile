pipeline {
    agent any

    environment {
        TF_CLOUD_TOKEN = credentials('TERRAFORM_CLOUD_TOKEN') // Use Jenkins credentials
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'Terraform', 
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/ShreyasBhagat2802/Django-Project-1.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                script {
                    // Fix potential credential issues
                    sh 'rm -f ~/.terraform.d/credentials.tfrc.json || true'
                    sh 'echo "{ \"credentials\": { \"app.terraform.io\": { \"token\": \"$TF_CLOUD_TOKEN\" } } }" > ~/.terraform.d/credentials.tfrc.json'
                }
                
                sh '''
                    terraform --version
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
