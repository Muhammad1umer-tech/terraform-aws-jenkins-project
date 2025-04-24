This project demonstrates the deployment of a complete CI/CD pipeline on AWS using Jenkins, Terraform, and a Flask application backed by a MySQL RDS database. It uses multiple AWS services and high availability to ensure high availability, scalability, and security.

### Key Components

1. **Jenkins Setup**
   - Automate CI/CD pipeline provisioning using Terraform.
   - Jenkins is hosted on an EC2 instance in the `us-east-1f` region.

2. **Flask App Deployment**
   - Deploy a Python Flask application to EC2 instances in the `us-east-1a` and `us-east-1b`region.
   - Ensure high availability and scalability using AWS Elastic Load Balancer (ELB).

3. **Database Configuration**
   - Utilize **Amazon RDS for MySQL** for scalable and managed database storage.

---

## AWS Architecture Overview

- **Regions**:
  - `us-east-1f` for Jenkins
  - `us-east-1a`,`us-east-1b` and `us-east-1c` for Flask App (EC2) and MySQL RDS

- **Services Used**:
  - EC2 for hosting Jenkins and Flask
  - Elastic Load Balancer for high availability
  - Amazon RDS (MySQL) for data persistence

---

## Tools & Technologies

- Terraform (Infrastructure as Code)
- Jenkins (Continuous Integration & Deployment)
- Flask (Python Web Framework)
- MySQL (Relational Database)
- AWS (EC2, RDS, ELB, VPC, IGW, RouteTables)

---
