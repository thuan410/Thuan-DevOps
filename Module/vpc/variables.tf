# Create Subnet Public
variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public Subnet CIDR values"
  default = [ "10.0.1.0/24" ]
}


# Create Subnet Private
variable "private_subnet_cidrs" {
  type = list(string)
  description = "Private Subnet CIDR values"
  default = [ "10.0.2.0/24" ]
}

# Create Availability Zones
variable "azs" {
  type = list(string)
  description = "Availability Zones"
  default = [ "eu-cental-1a" ]
}