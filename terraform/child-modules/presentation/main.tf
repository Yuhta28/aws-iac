module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name               = var.ALB-name
  load_balancer_type = "application"
  #terraform_remote_stateでNWリソースのstateファイル情報を参照している
  vpc_id             = data.terraform_remote_state.remote_network_stack_state.outputs.VPC_id
  subnets            = data.terraform_remote_state.remote_network_stack_state.outputs.VPC_PublicSubnets

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

  enable_deletion_protection = false
}
