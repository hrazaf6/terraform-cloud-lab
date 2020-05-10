module "vpc" {
  source = "../../modules/networking"
  vpc_name  = "Development-VPC"
}

module "web_cluster" {
  source            = "../../modules/compute"
  instance_type     = "t2.micro"
  cluster_name      = var.cluster_name
  max_instance_size = 3
  min_instance_size = 3
  private_subnets   = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id
}

module "frontend" {
  source             = "../../modules/frontend"
  cluster_name       = var.cluster_name
  elb_security_group = module.web_cluster.elb_security_group
  asg_id             = module.web_cluster.asg_id
  public_subnets     = module.vpc.public_subnets
}