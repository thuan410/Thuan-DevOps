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
resource "aws_internet_gateway" "i_gw" {
  vpc_id = aws_vpc.Thuan_VPC.id

  tags = {
    Name = "Thuan_IGW"
  }
}


# Create Route Tables Public
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.Thuan_VPC.id
  
  route    {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i_gw.id
  } 


  tags = {
    Name = "RT_Public"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.rt_public.id
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



