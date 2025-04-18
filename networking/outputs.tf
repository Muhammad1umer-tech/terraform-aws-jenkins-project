output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}


output "custom_vpc_id"{
    value = aws_vpc.custom_vpc.id
}