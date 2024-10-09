


variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}

variable "public_subnet_cidr" {
  default = "subnet-096a1f980799df5ad"
}

variable "internet_gateway" {
  default = "igw-02c45243167d46c6d"
}