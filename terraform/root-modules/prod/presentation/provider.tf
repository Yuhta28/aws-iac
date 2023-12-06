provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      IaC = "Terraform"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}