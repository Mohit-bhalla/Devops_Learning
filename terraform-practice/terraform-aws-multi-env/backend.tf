terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "multi-env/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
