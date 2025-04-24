@Library('github-shared-library') _
pipeline {
    agent any
    
    parameters {
        booleanParam(name: 'PLAN_TERRAFORM', defaultValue: false, description: 'Check to plan Terraform changes')
        booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
        booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
    }

    stages {
        stage('Clone Repository') {
            steps {
                greet('Cloning the GitHub project')
                deleteDir()
                git url: 'https://github.com/Muhammad1umer-tech/terraform-aws-jenkins-project.git', branch: 'main'
                greet('Successfully Cloned the GitHub project')
            }
        }
        
        stage('Plan Terraform') {
            steps {
                script {
                    if (params.PLAN_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-umer']]) {
                            dir('terraform-aws-jenkins-project') {
                                greet('Running terraform plan')
                                sh 'terraform init'
                                sh 'terraform plan'
                            }
                        }
                    }
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    if (params.APPLY_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-umer']]) {
                            dir('terraform-aws-jenkins-project') {
                                greet('Running terraform apply')
                                sh 'terraform apply -auto-approve'
                            }
                        }
                    }
                }
            }
        }

        stage('Destroy Terraform') {
            steps {
                script {
                    if (params.DESTROY_TERRAFORM) {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-crendentails-umer']]) {
                            dir('terraform-aws-jenkins-project') {
                                greet('Running terraform destroy')
                                sh 'terraform destroy -auto-approve'
                            }
                        }
                    }
                }
            }
        }
    }
}
