pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform Action')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'beta', 'prod'], description: 'Select Deployment Environment')
    }

    environment {
        TF_ENV = "${ENVIRONMENT}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'Terraform', url: 'https://github.com/ShreyasBhagat2802/Django-Project-1.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Select Terraform Cloud Workspace') {
            steps {
                script {
                    sh """
                    terraform workspace select Terraform-${TF_ENV} || terraform workspace new Terraform-${TF_ENV}
                    """
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh "terraform plan -var-file=${TF_ENV}.tfvars"
                }
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh "terraform apply -var-file=${TF_ENV}.tfvars -auto-approve"
                    } else if (params.ACTION == 'destroy') {
                        sh "terraform destroy -var-file=${TF_ENV}.tfvars -auto-approve"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Terraform ${params.ACTION} completed successfully for ${params.ENVIRONMENT} environment! ✅"
        }
        failure {
            echo "Terraform ${params.ACTION} failed for ${params.ENVIRONMENT} environment ❌"
        }
    }
}
