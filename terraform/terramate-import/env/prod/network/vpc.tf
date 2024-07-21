module "network" {
  source     = "../../../module/network"
  vpc_name   = "main"
  env        = "prod"
  cidr_block = "192.168.0.0/16"
}