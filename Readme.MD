# 🚀 CI/CD Pipeline with Jenkins, Flask, and MySQL on AWS

## 🔍 Project Overview

This project demonstrates the deployment of a complete CI/CD pipeline on AWS using Jenkins, Terraform, and a Flask application backed by a MySQL RDS database. It leverages multiple AWS services to ensure high availability, scalability, and security.

### 🔧 Key Components

1. **Jenkins Setup**
   - CI/CD pipeline provisioning using Terraform.
   - Jenkins is hosted on an EC2 instance in the `us-east-1f` availability zone.

2. **Flask App Deployment**
   - Flask application deployed on EC2 instances across `us-east-1a` and `us-east-1b`.
   - High availability ensured with an AWS Elastic Load Balancer (ELB).

3. **Database Configuration**
   - Amazon RDS for MySQL provides scalable and managed data storage.
   - RDS deployed across multiple availability zones for resilience.

---

## 🌐 Application Access

- **Flask App URL**: [https://jhooq.org](https://jhooq.org)  
  Secure, custom domain hosting for public-facing application.

- **Jenkins Dashboard**: [https://jenkins.jhooq.org](https://jenkins.jhooq.org)  
  Secure subdomain access to manage your CI/CD pipelines.

---

## ☁️ AWS Architecture Overview

- **Regions & Availability Zones**:
  - `us-east-1f`: Jenkins (EC2)
  - `us-east-1a`, `us-east-1b`, `us-east-1c`: Flask App and RDS MySQL (EC2 + RDS)

- **Services Utilized**:
  - **EC2** for Jenkins and Flask hosting
  - **Elastic Load Balancer** for scalability and fault tolerance
  - **Amazon RDS (MySQL)** for managed relational database
  - **VPC**, **Internet Gateway**, and **Route Tables** for secure networking

---

## 🛠️ Tools & Technologies

- **Terraform** – Infrastructure as Code (IaC)
- **Jenkins** – Continuous Integration & Deployment (CI/CD)
- **Flask** – Lightweight Python Web Framework
- **MySQL (Amazon RDS)** – Scalable database
- **AWS Stack** – EC2, RDS, ELB, VPC, IGW, RouteTables

---
