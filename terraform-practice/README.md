🏗️ Project 1 — “Create an EC2 Instance”

# Launch a basic EC2 instance on AWS using Terraform.
Logic: Understanding provider, resource, and variables.
Reusable parts: EC2 resource definition & variable templates.
# AWS Services: EC2, Key Pair, Security Group

🏗️ Project 2 — “VPC + EC2 Infrastructure”

# Create a full VPC setup (VPC, subnets, route tables, internet gateway, EC2 instance).
Logic: Networking setup, inter-resource dependencies.
Reusable parts: VPC module, EC2 module.
# AWS Services: VPC, Subnets, IGW, EC2

🏗️ Project 3 — “3-Tier Architecture (Web + App + DB)”

# Deploy 3-tier infra using modules (e.g., ALB + Auto Scaling + RDS).
Logic: Resource relationships & load balancing.
Reusable parts: Web tier, DB tier modules.
# AWS Services: ALB, ASG, Launch Templates, RDS

🏗️ Project 4 — “Multi-Environment Setup”

# Deploy same infra (VPC, EC2, RDS) across multiple environments using workspaces.
Logic: Backend configuration & workspace handling.
Reusable parts: Environment-specific tfvars files.
# AWS Services: S3 (state), DynamoDB (lock), IAM

🏗️ Project 5 — “ECS or EKS Cluster Deployment”

# Full containerized environment using Terraform.
Logic: ECS task definitions, IAM roles, networking, autoscaling.
Reusable parts: ECS/EKS module.
# AWS Services: ECS/EKS, ECR, ALB, IAM, CloudWatch