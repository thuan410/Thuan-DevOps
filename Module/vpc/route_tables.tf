# Create Route Tables Public
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.Thuan_VPC.id

  route   {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i_gw.id
  } 

  tags = {
    Name = "RT_Public"
  }
}

# Associate Public route tables to Public subnet
resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.rt_public.id
}


# Create Route Tables Private
resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.Thuan_VPC.id

  route  {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id  
  }
tags = {
  Name = "RT_Private"
}
}

# Associate Public route tables to Private subnet
resource "aws_route_table_association" "private_subnet_asso" {
  subnet_id = aws_route_table.rt_private
  route_table_id = aws_route_table.rt_private.id
}