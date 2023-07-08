terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      IaC = "Terraform"
    }
  }
}

module "prod-presentation" {
  source                     = "../../../child-modules/presentation"
  web_SG-name                = "Web"
  remote_network_stack_state = "aws-terraform-nw-prod"
  vpc_id = module.prod-presentation.stack_state.vpc_id
  
}
