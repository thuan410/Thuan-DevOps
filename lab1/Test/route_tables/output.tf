output "RT_public_id" {
  value = aws_route.public
  description = "route tables id"
}

output "RT_private_id" {
  value = aws_route.private
}