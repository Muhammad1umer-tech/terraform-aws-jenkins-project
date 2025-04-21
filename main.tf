module "network" {
  source     = "./networking"
  cidr_block = "10.0.0.0/16"
  public_subnet_1 = "10.0.1.0/24"
  public_subnet_2 = "10.0.2.0/24"
  private_subnet_1 = "10.0.3.0/24"
  private_subnet_2 = "10.0.4.0/24"

}

module "EC2" {
  source  = "./ec2"
  ami = "ami-084568db4383264d4"
  public_subnet_ids  = module.network.public_subnet_ids
  private_ip_ec2_instance = "10.0.1.4"
  public_key_path = "./terraform_public_ec2.pub"
  custom_vpc_id = module.network.custom_vpc_id
  start_app_file_path = "templates/start_app.sh"
  ec2_custom_sg_id = module.securityGroup.ec2_custom_sg_id 
  host = module.database.host
  db = "custom_db"                 
  username = "custom_db"
  password = "custom_db"       
  depends_on = [
    module.database
  ]
}

module "securityGroup" {
  source = "./securityGroup"
  custom_vpc_id = module.network.custom_vpc_id
}

module "alb" {
  source  = "./alb"
  public_subnet_ids  = module.network.public_subnet_ids
  ec2_custom_sg_id = module.securityGroup.ec2_custom_sg_id 
  custom_vpc_id = module.network.custom_vpc_id
  custom_instance_id = module.EC2.custom_instance_id
}


module "database" {
  source = "./rds"
  mysql_db_identifier = "custom-db"
  mysql_dbname = "custom_db"
  mysql_username = "custom_db"
  mysql_password = "custom_db"
  custom_vpc_id = module.network.custom_vpc_id
  ec2_custom_sg_id = module.securityGroup.ec2_custom_sg_id
  private_subnet_ids = module.network.private_subnet_ids

}