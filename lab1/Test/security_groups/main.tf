resource "aws_security_group" "sg_ec2" {
  name        = "sg_ec2"
  description = "Security group for EC2"
  vpc_id      = var.vpc_cidr_block

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security_Groups"
  }
}

resource "aws_security_group" "public" {
  name = "ssh_form_instacne"
  vpc_id = var.vpc_cidr_block

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["12.0.1.0/24"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public EC2 Security Group"
  }

 
}

resource "aws_security_group" "private" {
  name = "private_ec2_sg"
  description = "Allow access from Public EC2 on specific ports"
  vpc_id = var.vpc_cidr_block

  ingress {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    description = "Allow HTTP from Public EC2"
    cidr_blocks = ["12.0.2.0/24"]
  }

  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}