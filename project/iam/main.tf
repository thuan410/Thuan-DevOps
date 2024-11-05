resource "aws_iam_user" "iam" {
  name = var.create_user
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.iam.name
  pgp_key = var.pgp_key
}

resource "aws_iam_access_key" "pgp" {
  user = aws_iam_user.iam.name
}