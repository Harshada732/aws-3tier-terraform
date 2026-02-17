## AWS 3-Tier Web App Deployment using Terraform

## 📌 Project Overview
This project demonstrates automated infrastructure deployment on AWS using Terraform (Infrastructure as Code).  
It provisions a scalable and secure 3-tier architecture.

## 🏗️ Architecture

**Web Tier**
- EC2 instances in public subnet
- Security Group: web_sg
- Application Load Balancer (ALB)

**App Tier**
- EC2 instances in private subnet
- Security Group: app_sg
- Receives traffic only from Web Tier

**DB Tier**
- MySQL RDS in private subnet
- Security Group: db_sg
- Receives traffic only from App Tier

**Network**
- VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway

---

## ⚙️ Tools & Services
- Terraform  
- AWS  
- GitHub  

---

## 📂 Terraform Files
- provider.tf  
- variables.tf  
- vpc.tf  
- subnets.tf  
- security.tf  
- web.tf  
- alb.tf  
- app.tf  
- rds.tf  
- outputs.tf  

---

## ▶️ How to Deploy
```bash
terraform init
terraform plan
terraform apply
