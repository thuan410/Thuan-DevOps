variable "destination_cidr_block" {
  type = string
  description = "Set the destination cidr block"
}

variable "internet_gateway" {
  default = "igw-02c45243167d46c6d"
}

variable "vpc_cidr_block" {
  default = "vpc-06b9b8184ca36a630"
}

variable "nat_gateway" {
  default = "nat-087bcb67b748ea483"
}

variable "public_subnet_cidr" {
  default = "subnet-096a1f980799df5ad"
}

variable "private_subnet_cidr" {
  default = "subnet-033bba84038ff4fef"
}