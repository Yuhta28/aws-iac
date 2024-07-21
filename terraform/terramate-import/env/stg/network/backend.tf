terraform {
  backend "s3" {
    bucket = "terraform-backend-s3-yuta"
    key    = "stg/network/terraform.tfstate"
    region = "us-east-1"
  }
}
