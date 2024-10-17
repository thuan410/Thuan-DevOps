# thiết lập user iam
resource "aws_iam_user" "this" {
  count = var.create_user ? 1: 0

  name = var.name

  tags = var.tags
}

# tạo khóa để liên kết với aws
resource "aws_iam_access_key" "this" {
  count = var.create_user && var.create_iam_access_key ? 1 : 0

  user = aws_iam_user.this[0].name
  pgp_key = var.pgp_key
  status = var.iam_access_key_status
}

resource "aws_iam_access_key" "this_no_pgp" {
  count = var.create_user && var.create_iam_access_key && (var.pgp_key != null && var.pgp_key != "")  ? 1 : 0

  user = aws_iam_user.this[0].name
  pgp_key = var.pgp_key
  status = var.iam_access_key_status
}

# Them chinh sach cho cac user
resource "aws_iam_user_policy_attachment" "this" {
  for_each = { for k, v in var.policy_arns : k => v if var.create_user }

  user       = aws_iam_user.this[0].name
  policy_arn = each.value
}

