resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}


resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = "C:/Users/Thuan/Downloads/${var.key_name}.pem"
}

resource "aws_instance" "public_instance" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [var.Security_Groups]
  subnet_id = var.public_subnet_cidr

  tags = {
    Name = "public_ec2"
  }
  
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [var.Security_Groups]
  subnet_id = var.private_subnet_cidr


  tags = {
    Name = "private_ec2"
  }
  
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}

resource "aws_instance" "test" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  subnet_id = var.public_subnet_cidr
  

   tags = {
    Name = "test"
  }
  
}