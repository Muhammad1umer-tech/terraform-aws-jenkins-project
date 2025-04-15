variable  "ami" {
    description = "Amazon machine image"
    type        = string
}

variable  "public_subnet_id" {
    description = "ID of public subnet"
    type        = string
}

variable "private_ip_ec2_instance" {
    description = "Private IP of the instance"
    type = string
}

variable "public_key_path" {
    description = "path for public key for ec2"
    type = string
}

variable "custom_vpc_id" {
    description = "Id of custom VPC"
    type = string
}