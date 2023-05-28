module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.NW-name
  cidr = var.cidr

  #サブネット設定
  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  #NAT-GW作成可否
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway


  tags = {
    Terraform        = "true"
  }
}