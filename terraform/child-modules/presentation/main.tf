module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name               = var.ALB-name
  load_balancer_type = "application"
  vpc_id             = var.vpc_id
  subnets            = var.ALB-subnets
  security_groups    = [module.security-group_web.security_group_id]
  security_group_rules = {
    ingress_all_http = {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP web traffic"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress_all_https = {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS web traffic"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
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
