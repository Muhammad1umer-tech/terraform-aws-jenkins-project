variable  "ami" {
    description = "Amazon machine image"
    type        = string
}

variable "ec2_custom_sg_id" {
    description = "Ec2 instance SG id"
    type        = string
}
variable  "public_subnet_ids" {
    description = "IDs of public subnet"
    type        = list(string)
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

variable "start_app_file_path" {
    description = "Start App file path"
    type = string
}


variable "host" {

}

variable "db" {

}

variable "username" {

}

variable "password" {

}