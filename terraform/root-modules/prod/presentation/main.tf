terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    hostname = "spacelift.io"
    organization = "yuhta28"

    workspaces {
      name = "AWS-Terraform-Presentation-Prod"
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
  source      = "../../../child-modules/presentation"
  web_SG-name = "Web"
}
