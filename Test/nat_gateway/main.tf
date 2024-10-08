resource "aws_eip" "eip" {
  depends_on = [ var.internet_gateway ]
}

resource "aws_nat_gateway" "nat_gw" {
  count = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.eip.id
  subnet_id = var.public_subnet_cidr
  depends_on = [ var.internet_gateway ]

  tags = {
    Name = "NAT_Gateway"
  }
}