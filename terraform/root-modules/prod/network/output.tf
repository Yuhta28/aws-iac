output "VPC_info" {
  value = module.prod-network.VPC_info
}

output "VPC_id" {
  value = module.prod-network.VPC_info.vpc_id
}

output "VPC_DBsubnets" {
  value = module.prod-network.VPC_info.database_subnets
}

output "VPC_PublicSubnets" {
  value = module.prod-network.VPC_info.public_subnets
}

output "VPC_PrivateSubnets" {
  value = module.prod-network.VPC_info.private_subnets
}