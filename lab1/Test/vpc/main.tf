resource "aws_vpc" "thuan_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Thuan_VPC"
  }
}