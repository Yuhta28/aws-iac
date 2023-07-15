module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name               = var.ALB-name
  load_balancer_type = "application"
  vpc_id             = var.vpc_id
  subnets            = var.ALB-subnets
  security_groups    = [module.security-group_web.security_group_id]
}

module "security-group_web" {
  source = "terraform-aws-modules/security-group/aws"

  name                = var.web_SG-name
  description         = "Security Group for ALB"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = [
    "https-443-tcp",
    "http-80-tcp"
  ]
  egress_rules = [
    "all-all"
  ]
}
