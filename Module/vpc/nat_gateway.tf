resource "aws_eip" "nat_eip" {
  depends_on = [ aws_internet_gateway.i_gw ]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id    
  subnet_id = aws_subnet.public_subnets.id
  depends_on = [ aws_internet_gateway.i_gw ]

  tags = {
    Name = "Thuan_NAT_GW"
  }
}

