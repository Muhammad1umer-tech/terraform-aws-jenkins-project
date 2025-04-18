output "custom_sg_id"{
    value = aws_security_group.custom_sg.id
}

output "custom_instance_id"{
    value = aws_instance.custom_public_ec2.id
}