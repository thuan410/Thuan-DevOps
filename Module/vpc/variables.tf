# Create VPC
variable "vpc_cidr" {
  type = string
  description = "VPC"
  default = "10.0.0.0/16"
}

# Create Subnet Public
variable "public_subnet_cidrs" {
  type = string
  description = "Public Subnet CIDR values"
  default = "10.0.1.0/24" 
}


# Create Subnet Private
variable "private_subnet_cidrs" {
  type = string
  description = "Private Subnet CIDR values"
  default = "10.0.4.0/24" 
}

# Create Availability Zones
variable "azs" {
  type = string
  description = "Availability Zones"
  default = "us-east-1a" 
}

variable "key_name" {
  description = "Name of the SSH key pair"
}