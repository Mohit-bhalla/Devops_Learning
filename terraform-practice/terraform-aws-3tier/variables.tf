variable "aws_region" {
  default = "ap-south-1"
}

variable "aws_profile" {
  default = "default"
}

variable "key_name" {
  description = "AWS Key Pair"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}
#------------------new part for RDS DB instance--------------------
variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
