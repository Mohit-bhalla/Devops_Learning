# reusable for defining variables for AWS EC2 instance deployment
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # Mumbai
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
  default     = "default"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"  # change according to need
}

variable "key_name" {
  description = "Name of existing AWS key pair"
  type        = string # key value pair for name and value
}

variable "instance_name" {
  description = "EC2 instance name tag"
  type        = string
  default     = "terraform-ec2-demo" # the name of the instance that show in AWS console
}
#---------------------------------------------------
# new part for VPC and Subnet CIDR blocks

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}


