# 🚀 SimpleTimeService on AWS (ECS Fargate + ALB)

This project deploys a minimal microservice, `SimpleTimeService`, to AWS using ECS Fargate behind an Application Load Balancer (ALB), fully provisioned using Terraform. The container image is hosted publicly on Docker Hub.

---

## 📦 Service Overview

- **Language**: Python  
- **Framework**: Flask  
- **Containerized**: Docker (non-root user)  
- **Infra**: AWS (VPC, ECS Fargate, ALB, NAT Gateway)  
- **IaC**: Terraform (modular, S3 remote backend)  


## 🛠️ Prerequisites
- Terraform ~> 1.10
- AWS CLI configured with appropriate IAM permissions
- S3 bucket for remote state already created (see `backend.tf`)

## 🧑‍💻 Deployment Steps

### 1. Clone the repo

```bash
git clone https://github.com/jaypatil22/particle41-devops-challenge-senior.git
cd particle41-devops-challenge-senior/terraform
```
### 2. Configure AWS CLI
Configure AWS credentials using either of the below commands. Make sure the principal being configured has the required permissions.
```bash
aws configure
aws configure sso
```

### 3. Initialize Terraform
Update backend s3 bucket name in `backend.tf`
```bash
terraform init
```
Uses the backend.tf config to enable remote state in S3

No DynamoDB needed — uses S3 native state locking

### 4. Run `terraform plan`
```bash
terraform plan -var-file=terraform.tfvars -out=plan.out
```

### 5. Run `terraform apply`
```bash
terraform apply -auto-approve "plan.out"
```

### 6. Access the application
Visit the ALB DNS from output to access the application(may take few minutes to update)
```bash
alb_dns_name = "particle41-devops-challenge-alb-<random-suffix>.ap-south-1.elb.amazonaws.com"
```

## 📄 Response Format

On accessing the service via `/` path, you’ll get a JSON response like:

```json
{
  "timestamp": "2025-04-17T13:45:23Z",
  "ip": "203.0.113.42"
}
