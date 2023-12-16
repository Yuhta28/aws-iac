output "VPC_info" {
  value = module.vpc
}

output "ec2_connect_endpoint" {
  value = aws_ec2_instance_connect_endpoint.ec2_connect_endpoint
}