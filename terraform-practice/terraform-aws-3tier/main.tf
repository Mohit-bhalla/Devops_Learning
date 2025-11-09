module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "web" {
  source           = "./modules/ec2-asg"
  subnet_ids       = module.vpc.public_subnets
  key_name         = var.key_name
  target_group_arn = module.alb.target_group_arn
}

module "db" {
  source      = "./modules/rds"
  db_subnets  = module.vpc.private_subnets
  db_username = var.db_username
  db_password = var.db_password
}
