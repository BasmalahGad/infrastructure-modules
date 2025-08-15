module "vpc" {
  source = "./modules/vpc"

  project               = var.project
  vpc_cidr              = var.vpc_cidr
  private_subnets_cidrs = var.private_subnets_cidrs
  public_subnets_cidrs  = var.public_subnets_cidrs
  azs                   = var.azs
}