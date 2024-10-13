# Nhập tên của khóa
variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "Security_Groups" {
  default = "sg-08cf8b18104640d33"
}

variable "Security_Public" {
  default = ""
}

variable "public_subnet_cidr" {
  default = "subnet-096a1f980799df5ad"
}

variable "private_subnet_cidr" {
  default = "subnet-033bba84038ff4fef"
}