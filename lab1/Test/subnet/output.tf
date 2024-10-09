output "ip_subnet_public" {
  description = "IP of subnet public"
  value = aws_subnet.subnet_pb
}

output "ip_subnet_private" {
  description = "IP of subnet private"
  value = aws_subnet.subnet_pr
}