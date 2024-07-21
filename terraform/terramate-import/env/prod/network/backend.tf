terraform {
  backend "s3" {
    bucket = "terraform-backend-s3-yuta"
    key    = "prod/network/terraform.tfstate"
    region = "us-east-1"
  }
}
