terraform {
  backend "s3" {
    bucket = "terraform-backend-s3-yuta"
    key    = "stg/storage/terraform.tfstate"
    region = "us-east-1"
  }
}
