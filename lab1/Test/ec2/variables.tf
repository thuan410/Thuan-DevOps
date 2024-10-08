variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "Security_Groups" {
  default = "sg-09c32e062c0e4bdf3"
}

variable "public_subnet_cidr" {
  default = "subnet-0dbb4fe3e9bc79fbf"
}

variable "private_subnet_cidr" {
  default = "subnet-0387b9aebfca4b16d"
}