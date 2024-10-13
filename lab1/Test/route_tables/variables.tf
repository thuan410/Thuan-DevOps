variable "destination_cidr_block" {
  type = string
  description = "Set the destination cidr block"
}

variable "internet_gateway" {
  # giá trị phụ thuộc vào i_gw
  default = "igw-02c45243167d46c6d"
}

variable "vpc_cidr_block" {
  # giá trị phụ thuộc vào VPC
  default = "vpc-06b9b8184ca36a630"
}

variable "nat_gateway" {
  # giá trị phụ thuộc vào NAT
  default = "nat-087bcb67b748ea483"
}

variable "public_subnet_cidr" {
  # giá trị phụ thuộc vào SUbnet Public
  default = "subnet-096a1f980799df5ad"
}

variable "private_subnet_cidr" {
  # giá trị phụ thuộc vào SUbnet Private
  default = "subnet-033bba84038ff4fef"
}