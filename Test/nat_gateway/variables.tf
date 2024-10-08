variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}

variable "public_subnet_cidr" {
  default = "subnet-0dbb4fe3e9bc79fbf"
}

variable "internet_gateway" {
  default = "igw-0c5de8d68f6e04c0b"
}