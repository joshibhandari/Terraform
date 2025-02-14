module "vpc" {
  source              = "./modules/vpc/"
  cidr                = "10.0.0.0/18"
  vpc_name            = "my_vpc"
  create_vpc          = true
}

module "ec2" {
  source = "./modules/ec2/"
  instances_count = var.instances_count
  vpc_id = module.vpc.vpc_id
}
