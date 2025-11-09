# create vpc -> subnet ->internet gateway -> route table + route -> security group -> ec2 instance

# 1️⃣ Create VPC

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform-vpc"
  }
}


# 2️⃣ Create Subnet

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet"
  }
}

# 3️⃣ Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

# 4️⃣ Route Table + Route
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-public-rt"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


# 5️⃣ Security Group
resource "aws_security_group" "web_sg" {
  name        = "terraform-web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

# 6️⃣ EC2 Instance
resource "aws_instance" "web" {
  ami                    = "ami-0dee22c13ea7a9a67" # manually updated
  instance_type          = var.instance_type  # t3.micro
  subnet_id              = aws_subnet.public_subnet.id # associate subnet with ec2
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id] # we can add multiple security groups

  tags = {
    Name = "terraform-web-server"
  }
}
