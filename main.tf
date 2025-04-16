module EC2 {
  source  = "./ec2"
  ami = "ami-084568db4383264d4"
}
module "network" {
  source     = "./networking"
  cidr_block = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
  private_subnet = "10.0.2.0/24"
}
