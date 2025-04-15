variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "public_subnet" {
  description = "Public subnet IP range"
  type        = string
}


variable "private_subnet" {
  description = "Private subnet IP range"
  type        = string
}
