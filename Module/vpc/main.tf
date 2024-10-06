# Create VPC
resource "aws_vpc" "Thuan_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Thuan_VPC"
  }
}

# Create Subnet Public
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.Thuan_VPC.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

# Create Subnet Private
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.Thuan_VPC.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Thuan_VPC.id

  tags = {
    Name = "Thuan_IGW"
  }
}
