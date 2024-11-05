output "iam" {
  description = "IAM of your AWS"
  value = var.create_user
}

output "key" {
  description = "abc"
  value = var.create_iam_access_key
}

output "iam_access_key" {
  description = "abc"
  value = try(aws_iam_access_key.key.id, aws_iam_access_key.pgp.id)
}

output "iam_access_key_secret" {
  description = "abc"
  value = try(aws_iam_access_key.pgp.secret, "")
  sensitive   = true 
}