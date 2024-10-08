variable "destination_cidr_block" {
  type = string
  description = "Set the destination cidr block"
}

variable "internet_gateway" {
  default = "igw-0c5de8d68f6e04c0b"
}

variable "vpc_cidr_block" {
  default = "vpc-0137e5c7664d1fab5"
}

variable "nat_gateway" {
  default = "nat-0628041898ecb7e0d"
}

variable "public_subnet_cidr" {
  default = "subnet-0dbb4fe3e9bc79fbf"
}

variable "private_subnet_cidr" {
  default = "subnet-0387b9aebfca4b16d"
}