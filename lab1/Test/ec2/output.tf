output "ec2_public_id" {
  value = aws_instance.public_instance
  description = "ID of ec2 public"
}

output "ec2_private_id" {
  value = aws_instance.private_ec2
  description = "ID of ec2 private"
}

output "ec2_test_id" {
  value = aws_instance.test
  description = "ID of ec2"
}