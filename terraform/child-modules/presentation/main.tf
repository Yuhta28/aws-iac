#module "alb" {
#    source = "terraform-aws-modules/alb/aws"
#    version = "~> 8.0"
#
#    name = var.ALB-name
#    load_balancer_type = "application"
#}

module "security-group_web" {
  source = "terraform-aws-modules/security-group/aws"

  name                = var.web_SG-name
  description         = "Security Group for ALB"
  vpc_id              = "vpc-00f452c4ee7d20190"
  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}