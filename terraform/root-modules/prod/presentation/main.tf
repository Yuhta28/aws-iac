terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "prod-presentation" {
  source      = "../../../child-modules/presentation"
  web_SG-name = "Web"
}