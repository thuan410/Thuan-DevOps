resource "aws_route_table" "public" {
  vpc_id = var.vpc_cidr_block

  tags = {
    Name = "RT_public"
  }
}

resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id = var.internet_gateway
}

resource "aws_route_table_association" "public" {
  subnet_id = var.public_subnet_cidr
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = var.vpc_cidr_block

    tags = {
      Name = "RT private"
    }
}

resource "aws_route" "private" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id = var.nat_gateway
}

resource "aws_route_table_association" "private" {
  subnet_id = var.private_subnet_cidr
  route_table_id = aws_route_table.private.id
}