resource "aws_vpc" "custom_vpc" {
  cidr_block =  var.cidr_block

  tags = {
    Name = "custom-vpc"
  }

}


resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.public_subnet_1
  # map_public_ip_on_launch = true # wont work
  availability_zone = "us-east-1a"

  tags = {
    Name = "custom-public-subnet_1"
  }

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.public_subnet_2
  availability_zone = "us-east-1b"

  tags = {
    Name = "custom-public-subnet_2"
  }

}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.private_subnet_1
  availability_zone = "us-east-1a"

  tags = {
    Name = "custom-private-subnet_1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.private_subnet_2
  availability_zone = "us-east-1b"

  tags = {
    Name = "custom-private-subnet_2"
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


resource "aws_route_table_association" "custom_route_table_association_1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.custom_route_table.id}"
}

resource "aws_route_table_association" "custom_route_table_association_2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.custom_route_table.id}"
}