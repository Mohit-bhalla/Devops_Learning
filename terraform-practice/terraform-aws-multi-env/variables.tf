variable "aws_region" {
  default = "ap-south-1"
}

variable "aws_profile" {
  default = "default"
}

variable "environment" {
  description = "Environment name"
  type        = string
}
