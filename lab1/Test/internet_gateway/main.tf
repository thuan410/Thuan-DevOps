resource "aws_internet_gateway" "i_gw" {
  vpc_id = var.vpc_cidr_block

  tags = {
    Name = "Thuan_IGW"
  }
}