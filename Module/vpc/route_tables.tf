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

resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.rt_public.id
}