resource "aws_security_group" "security_public" {
  name        = "Security_Groups_Thuan123"
  description = "Allow HTTPS to web server"
  vpc_id      = aws_vpc.Thuan_VPC.id

  ingress {
    description = "HTTPS ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["12.0.1.0/24"] # ip (12.0.1.0 -> 12.0.1.225)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["12.0.1.0/24"] # ip (12.0.1.0 -> 12.0.1.225)
  }
}


