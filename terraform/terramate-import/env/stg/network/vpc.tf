module "network" {
  source     = "../../../module/network"
  vpc_name   = "main"
  env        = "stg"
  cidr_block = "10.0.0.0/16"
}