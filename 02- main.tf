module "vpc" {
  source = "./modules/vpc"

  project              = var.project
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  azs                  = var.azs
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.project
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnets_ids
  node_groups        = var.node_groups
  security_group_id  = module.vpc.security_group_id
}