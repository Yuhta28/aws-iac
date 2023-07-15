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

module "prod-app" {
  source       = "../../../child-modules/app"
  cluster_name = "Prod-frontend"
}