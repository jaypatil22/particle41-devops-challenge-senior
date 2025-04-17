module "vpc" {
  providers = {
    aws = aws
  }
  source      = "./vpc"
  name_prefix = var.name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "alb" {
  source            = "./alb"
  name_prefix       = var.name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ecs" {
  source             = "./ecs"
  name_prefix        = var.name_prefix
  image_uri          = var.image_uri
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.alb.target_group_arn
  alb_sg_id          = module.alb.security_group_id
  alb_listener       = module.alb # dummy to force dependency
}