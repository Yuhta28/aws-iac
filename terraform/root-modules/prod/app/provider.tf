provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      IaC = "Terraform"
    }
  }
}