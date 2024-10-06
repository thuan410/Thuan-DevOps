# Create VPC
resource "aws_vpc" "Thuan_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Thuan_VPC"
  }
}

# Create Subnet Public
resource "aws_subnet" "public_subnets" {
 
  vpc_id = aws_vpc.Thuan_VPC.id
  cidr_block = var.public_subnet_cidrs
  availability_zone = var.azs

  tags = {
    Name = "Public Subnet"
  }
}

# Create Subnet Private
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.Thuan_VPC.id
  cidr_block = var.private_subnet_cidrs
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





# Create Security Groups (default)
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.Thuan_VPC.id

  ingress  {
    protocol = -1
    self = true
    from_port = 0 
    to_port = 0
  }


  egress  {
    from_port = 0
    to_port = 0
    protocol = -1

  }
   
  tags = {
    Name = "Security Groups"
  }
}



