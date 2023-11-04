terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "prod-domain" {
  source      = "../../../child-modules/domain"
  domain_name = "\"yuta-aws.work\""
}