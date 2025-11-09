resource "aws_instance" "web_server" {
  ami           = "ami-0dee22c13ea7a9a67" # Amazon Linux 2 (Mumbai) manuly updated AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
  }
}
