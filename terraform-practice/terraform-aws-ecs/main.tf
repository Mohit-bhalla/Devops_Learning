module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = "myapp"
}

module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = "${var.environment}-cluster"
}

module "ecs_service" {
  source           = "./modules/ecs-service"
  cluster_id       = module.ecs_cluster.cluster_id
  subnet_ids       = module.vpc.public_subnets
  sg_id            = module.vpc.security_group_id
  vpc_id           = module.vpc.vpc_id
  target_group_arn = aws_lb_target_group.app_tg.arn
  image_url        = module.ecr.repository_url
  environment      = var.environment
}
