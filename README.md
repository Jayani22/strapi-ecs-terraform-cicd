#  Strapi Deployment on AWS ECS Fargate using Terraform & GitHub Actions

## Project Overview

This project deploys a **Strapi application** on **AWS ECS Fargate** using a fully automated Infrastructure-as-Code and CI/CD workflow.

The entire setup is managed using:

- Terraform (Infrastructure provisioning)
- GitHub Actions (CI/CD pipeline)
- Amazon ECR (Docker image registry)
- ECS Fargate (Container orchestration)
- Application Load Balancer (Public access)

---


## Technologies Used

- AWS ECS Fargate
- Amazon ECR
- Application Load Balancer
- CloudWatch Logs
- Terraform (modular structure)
- GitHub Actions
- Docker
- Strapi


---

## ⚙️ Infrastructure (Terraform)

Terraform provisions:

- ECS Cluster (Fargate)
- ECS Service & Task Definition
- Application Load Balancer
- Target Group & Listener
- Security Groups
- Amazon ECR Repository
- CloudWatch Logging
- Existing VPC (default)
- Existing ECS task execution role

---

## 🔄 CI/CD Workflow (GitHub Actions)

On every push:

1. Build Docker image
2. Tag image using commit SHA
3. Push image to Amazon ECR
4. Run Terraform apply
5. Create new ECS task definition revision
6. Perform rolling update automatically


## 🔐 Environment & Permissions

- AWS credentials are provided through GitHub Secrets.
- Terraform state stored in S3 backend.
- IAM and networking resources reuse existing company infrastructure.

## 🚀 How Deployment Works

1. Developer pushes code.
2. GitHub Actions builds and pushes container.
3. Terraform updates ECS task definition.
4. ECS performs rolling deployment without downtime.