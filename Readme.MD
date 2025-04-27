# CI/CD Pipeline Deployment with Jenkins, Flask, and AWS Services

## Project Overview

This project demonstrates the deployment of a full CI/CD pipeline using Jenkins, Terraform, and a Flask application hosted on AWS. The setup includes secure, scalable infrastructure for continuous integration and deployment, web app hosting, and database management using various AWS services.

We use Terraform to automate infrastructure provisioning. Jenkins handles build and deployment pipelines. Flask serves the web application, while MySQL RDS provides reliable data storage. AWS services like EC2, RDS, ELB, VPC, and security groups ensure a robust, highly available architecture.


**AWS Services**:  
![EC2](https://img.shields.io/badge/AWS-EC2-FF9900?style=for-the-badge&logo=amazon-ec2&logoColor=white)
![RDS](https://img.shields.io/badge/AWS-RDS-527FFF?style=for-the-badge&logo=amazon-rds&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-844FBA?style=for-the-badge&logo=terraform&logoColor=white)
![VPC](https://img.shields.io/badge/AWS-VPC-232F3E?style=for-the-badge&logo=amazon-vpc&logoColor=white)
![ALB](https://img.shields.io/badge/AWS-ALB-009688?style=for-the-badge&logo=amazon-elastic-load-balancer&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-D24939?style=for-the-badge&logo=jenkins&logoColor=white)

---

## AWS Architecture

![Architecture](https://github.com/Muhammad1umer-tech/terraform-aws-jenkins-project/blob/main/image/image.png)

### Key Components:

- **Jenkins Setup**:
  - Hosted on an EC2 instance in `us-east-1f`.
  - Configured with Terraform scripts for automated provisioning.
  - Used to build and deploy the Flask app to multiple environments.

- **Flask Application**:
  - Deployed on EC2 instances in `us-east-1a` and `us-east-1b`.
  - Application traffic is balanced using AWS Elastic Load Balancer (ALB) to ensure availability.

- **Database Configuration**:
  - MySQL RDS deployed across `us-east-1a`, `us-east-1b`, and `us-east-1c`.
  - Provides failover support and scalability for backend storage.

---

## Deployment Architecture

### 1. Infrastructure Provisioning with Terraform

Infrastructure components such as EC2, RDS, Security Groups, and Load Balancer are provisioned using modular Terraform code organized into:

- `terraform/flask_app --> https://github.com/Muhammad1umer-tech/simple-flask-app-for-cloud`
- `terraform/jenkins --> https://github.com/Muhammad1umer-tech/Jenkins-AWS-infrastructure-provisioned`

### 2. EC2 Instances

- **Jenkins**:  
  Hosted in a secure subnet with restricted access, deployed via Terraform.

- **Flask App**:  
  Two EC2 instances deployed in separate availability zones behind a load balancer to ensure HA.

### 3. RDS MySQL

- Configured for Multi-AZ deployments across `us-east-1a`, `us-east-1b`, and `us-east-1c`.
- Attached with custom parameter and subnet groups for optimal configuration and security.

### 4. Load Balancer (ALB)

- Routes traffic to Flask EC2 instances.
- Ensures fault tolerance and consistent response during deployment rollouts.

### 5. Networking (VPC)

- Custom VPC setup with:
  - Public subnets for Jenkins and the Load Balancer.
  - Private subnets for Flask EC2 instances and RDS.
- Internet Gateway for public access.

---

## Security Configuration

- **Security Groups**:
  - Strict inbound/outbound rules for Jenkins, Flask, and used EC2 SG to allow inbound request to RDS.
  - ALB and Jenkins only expose necessary ports (e.g., 80/443, 8080).

- **IAM Roles**:
  - Used AWS access key and ID in Jenkins so that the pipeline can be able to provisioned infrastructuer.

---
