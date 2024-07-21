module "network" {
  source     = "../../../module/network"
  vpc_name   = "sub"
  env        = "stg"
  cidr_block = "10.0.0.0/16"
}