module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_ids     = module.vpc.public_subnets
  instance_type  = var.instance_type
  environment    = var.environment
}

module "rds" {
  source         = "./modules/rds"
  db_subnets     = module.vpc.private_subnets
  environment    = var.environment
}
