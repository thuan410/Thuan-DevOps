# Create VPC
resource "aws_vpc" "Thuan_VPC" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Thuan_VPC"
  }
}

# Create Subnet Public
resource "aws_subnet" "public_subnets" {

  vpc_id            = aws_vpc.Thuan_VPC.id
  cidr_block        = var.public_subnet_cidrs
  availability_zone = var.azs

  tags = {
    Name = "Public Subnet"
  }
}

# Create Subnet Private
resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.Thuan_VPC.id
  cidr_block        = var.private_subnet_cidrs
  availability_zone = var.azs

  tags = {
    Name = "Private Subnet "
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "i_gw" {
  vpc_id = aws_vpc.Thuan_VPC.id

  tags = {
    Name = "Thuan_IGW"
  }
}





# Create a security group
resource "aws_security_group" "sg_ec2" {
  name        = "sg_ec2"
  description = "Security group for EC2"
  vpc_id      = aws_vpc.Thuan_VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "Security_Groups"
  }
}



