module "vpc" {
  source = "./modules/vpc/"
  cidr = "10.0.0.0/18"
  vpc_name = "my_vpc"
}