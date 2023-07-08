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
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = [
    "https-443-tcp",
    "http-80-tcp"
  ]
}
