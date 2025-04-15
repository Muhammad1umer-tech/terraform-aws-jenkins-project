resource "aws_instance" "custom_public_ec2" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "custom_public_ec2"
  }
}