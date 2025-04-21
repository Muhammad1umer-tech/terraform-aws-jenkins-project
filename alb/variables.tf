variable  "custom_vpc_id" {
    description = "custom vpc id"
    type        = string
}

variable  "ec2_custom_sg_id" {
    description = "Custom sg id"
    type        = string
}


variable  "custom_instance_id" {
    description = "Custom instance id"
    type        = string
}


variable "public_subnet_ids" {
    description = "Public subnet IDs"
    type = list(string)
}

