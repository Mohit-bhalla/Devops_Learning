output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}
#----------new vpc id recive from main.tf file----------------
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
