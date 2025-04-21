resource "aws_eip" "custom_public_ip_eip" {
  network_interface = aws_network_interface.custom_ani.id

  depends_on = [
    aws_instance.custom_public_ec2
  ]

}



resource "aws_network_interface" "custom_ani" {
  subnet_id   = var.public_subnet_ids[0]
  private_ips = [var.private_ip_ec2_instance]
  security_groups = [var.ec2_custom_sg_id] 

  tags = {
    Name = "custom-ani"
  }
}

resource "aws_instance" "custom_public_ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.custom_public_instance_key.key_name
  user_data = templatefile("${var.start_app_file_path}", {
    host     = var.host
    username = var.username
    password = var.password
    db       = var.db
  })
 
  tags = {
    Name = "custom_public_ec2"
  }

  network_interface {
    network_interface_id = aws_network_interface.custom_ani.id
    device_index = 0
  }

}

resource "aws_key_pair" "custom_public_instance_key" {
  key_name   = "custom-public-instance-key"
  public_key = file(var.public_key_path)
}

