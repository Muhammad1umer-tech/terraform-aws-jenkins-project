variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}


variable "public_subnet_1" {
  description = "Public subnet IP 1 range"
  type        = string
}

variable "public_subnet_2" {
  description = "Public subnet IP 2 range"
  type        = string
}


variable "private_subnet_1" {
  description = "Private subnet IP range 1"
  type        = string
}

variable "private_subnet_2" {
  description = "Private subnet IP range 2"
  type        = string
}
