# Tên của user
output "iam_user_name" {
  description = "Tên của user"
  value = try(aws_iam_user.this[0].name, "")
}

# id khóa công khai
output "iam_access_key_id" {
  description = "the access key ID"
  value = try(aws_iam_access_key.this[0].id)
}


# id khóa bí mật
output "iam_access_key_secret" {
  description = "the access key secret"
  value = try(aws_iam_access_key.this_no_pgp[0].secret, "")
  sensitive = true
}


# cac chinh sanh 
output "policy_arns" {
  description = "The list of ARNs of policies directly assigned to the IAM user"
  value       = [for policy_attachment in aws_iam_user_policy_attachment.this : policy_attachment.policy_arn]
}