module "network" {
  source     = "./networking"
  cidr_block = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
  private_subnet = "10.0.2.0/24"
}

module "EC2" {
  source  = "./ec2"
  ami = "ami-084568db4383264d4"
  public_subnet_id  = module.network.public_subnet_id
  private_ip_ec2_instance = "10.0.1.4"
  public_key_path = "./terraform_public_ec2.pub"
  custom_vpc_id = module.network.custom_vpc_id
  start_app_file_path = "templates/start_app.sh"
  
}
