resource "aws_subnet" "subnet_pb" {
    vpc_id = var.vpc_cidr_block
    cidr_block = var.public_subnet_cidr
    availability_zone = var.azs

    tags = {
      Name = "Public Subnet"
    }
}

resource "aws_subnet" "subnet_pr" {
  vpc_id = var.vpc_cidr_block
  cidr_block = var.private_subnet_cidr
  availability_zone = var.azs

  tags = {
    Name = "Private Subnet"
  }
}

