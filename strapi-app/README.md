# Strapi Deployment Automation using GitHub Actions + Terraform

This project demonstrates a complete **CI/CD pipeline** for deploying a Dockerized Strapi application using:

- GitHub Actions (CI/CD)
- Docker
- Terraform
- AWS EC2
- Docker Hub

The goal is to automate build and deployment while following Infrastructure as Code (IaC) practices.
---
## Project Overview
The pipeline automates:

1. Building a Docker image whenever code is pushed.
2. Pushing the image to Docker Hub.
3. Deploying the latest image to an EC2 instance using Terraform.
4. Running the Strapi application inside a Docker container.

---
## Architecture Workflow
Developer -> GitHub -> GitHub Actions (CI)
-> DockerHub -> GitHub Actions(CD)
-> Terraform -> AWS EC2 -> Strapi Container


### Workflow Summary

### CI Pipeline (Automatic)
Triggered on push to `main` branch:

- Checkout source code
- Build Docker image
- Push image to Docker Hub

---

###  CD Pipeline (Manual)
Triggered manually using GitHub Actions:

- Initialize Terraform
- Plan & apply infrastructure
- Create/Update EC2 instance
- Install Docker via SSH
- Pull latest Docker image
- Run Strapi container

---

## 🛠️ Tech Stack

- Strapi (Node.js CMS)
- Docker
- GitHub Actions
- Terraform
- AWS EC2
- Docker Hub

---

### GitHub Secrets Used

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

EC2_SSH_KEY

DOCKER_USERNAME

DOCKER_PASSWORD


### Access Application
After Successful deployment

http://<EC2-PUBLIC-IP>:1337