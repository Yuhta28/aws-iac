terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "prod-app" {
  source       = "../../../child-modules/app"
  cluster_name = "Prod-frontend"
}
