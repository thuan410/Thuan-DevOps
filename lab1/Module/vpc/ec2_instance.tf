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

# Create EC2 number 1 
resource "aws_instance" "test" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
 

  tags = {
    Name = "test"
  }
}

# Create EC2 number 2 (use IP Address Public)

resource "aws_instance" "public_instance" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  subnet_id = aws_subnet.public_subnets.id

  tags = {
    Name = "public_ec2"
  }
  
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}


# Create EC2 number 3 (use IP Address Private)
resource "aws_instance" "private_instance" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  subnet_id              = aws_subnet.private_subnets.id

  tags = {
    Name = "private_ec2"
  }
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}