

resource "aws_db_instance" "custom_db" {
  allocated_storage       = 10
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  identifier              = var.mysql_db_identifier
  username                = var.mysql_username
  password                = var.mysql_password
  db_subnet_group_name    = aws_db_subnet_group.custom_db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.custom_sg_rds.id]
  db_name                 = var.mysql_dbname
  skip_final_snapshot     = true
  apply_immediately       = true
  backup_retention_period = 0
  deletion_protection     = false
}

resource "aws_db_subnet_group" "custom_db_subnet_group" {
  name       = "custom-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "custom_db_subnet_group"
  }
}

resource "aws_security_group" "custom_sg_rds" {
  name   = "custom-sg-rds"
  vpc_id = var.custom_vpc_id

  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    security_groups = [var.ec2_custom_sg_id]

  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
