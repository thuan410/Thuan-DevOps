resource "aws_eip" "eip" {
  depends_on = [ aws_internet_gateway.i_gw ]
}


# Create NAT Gateway in public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_subnets.id
  depends_on = [ aws_internet_gateway.i_gw ]

  tags = {
    Name = "Thuan_NAT_GW"
  }
}



