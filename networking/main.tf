resource "aws_vpc" "custom_vpc" {
  cidr_block =  var.cidr_block

  tags = {
    Name = "custom-vpc"
  }

}


resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.public_subnet

  tags = {
    Name = "custom-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "custom-private-subnet"
  }
}


resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "custom-igw"
  }
}


resource "aws_route_table" "custom_route_table" {
  vpc_id = "${aws_vpc.custom_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }
  
  tags = {
    Name = "custom-route-table"
  }
}


resource "aws_route_table_association" "custom_route_table_association" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.custom_route_table.id}"
}