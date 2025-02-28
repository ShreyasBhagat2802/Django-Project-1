pipeline {
    agent any

    // Define a choice parameter
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Choose Terraform Action')
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

        stage('Terraform Plan') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform plan'
                    } else {
                        sh 'terraform plan -destroy'
                    }
                }
            }
        }

        stage('Terraform Execution') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Terraform ${params.ACTION} successful! ✅"
        }
        failure {
            echo "Terraform ${params.ACTION} failed. ❌"
        }
    }
}
