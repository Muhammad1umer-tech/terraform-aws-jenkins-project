resource "aws_eip" "custom_public_ip_eip" {
  network_interface = aws_network_interface.custom_ani.id

  depends_on = [
    aws_instance.custom_public_ec2
  ]

}



resource "aws_network_interface" "custom_ani" {
  subnet_id   = var.public_subnet_id
  private_ips = [var.private_ip_ec2_instance]
  security_groups = [aws_security_group.custom_sg.id] 

  tags = {
    Name = "custom-ani"
  }
}

resource "aws_instance" "custom_public_ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.custom_public_instance_key.key_name
 
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


resource "aws_security_group" "custom_sg" {
  name   = "custom-sg"
  vpc_id = var.custom_vpc_id

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
