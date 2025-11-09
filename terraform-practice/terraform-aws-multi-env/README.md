# backend.tf
backend "s3" → stores Terraform state remotely.
dynamodb_table → used for state locking.
Prevents two people from applying changes at once.

# Create AWS S3 & DynamoDB Manually (once)

S3 = stores .tfstate file (truth of infra)
DynamoDB = ensures only one Terraform apply at a time

aws s3api create-bucket --bucket my-terraform-state-bucket --region ap-south-1
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST

# RUN different enviornments
--dev--
terraform workspace select dev
terraform plan -var-file="env/dev.tfvars"
terraform apply -var-file="env/dev.tfvars"
--stage--
terraform workspace select staging
terraform apply -var-file="env/staging.tfvars"
--prod--
terraform workspace select prod
terraform apply -var-file="env/prod.tfvars"

# verification
Check S3 → state file stored under different folders per workspace.

EC2, VPC, RDS → each tagged with the correct environment (dev, staging, prod).