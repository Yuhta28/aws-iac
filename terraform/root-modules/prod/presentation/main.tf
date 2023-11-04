terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "prod-presentation" {
  source                     = "../../../child-modules/presentation"
  remote_network_stack_state = "aws-terraform-nw-prod"

  ALB-name = "Prod-Web-ALB"

}
