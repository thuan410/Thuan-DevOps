resource "aws_vpc" "vpc_id" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "VPC"
  }
}