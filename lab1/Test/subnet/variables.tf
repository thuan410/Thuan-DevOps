
# Create Subnet Public
variable "public_subnet_cidr" {
  type = string
  description = "Public Subnet CIDR values"
}

# Create Subnet Private
variable "private_subnet_cidr" {
  type = string
  description = "Private Subnet CIDR values"
}

# Create Availability Zones
variable "azs" {
  type = string
  description = "Availability Zones"
  default = "us-east-1a"
}

variable "vpc_cidr_block" {
  description = "Connect VPC "
  default = "vpc-06b9b8184ca36a630"
} 
