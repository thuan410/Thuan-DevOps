variable "create_user" {
  description = "IAM of your AWS"
  type = string
  default = "Test123"
}

variable "create_iam_access_key" {
  description = "IAM access key"
  type = string
  default = "test"
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}