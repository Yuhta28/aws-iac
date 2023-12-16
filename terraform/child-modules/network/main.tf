module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  #サブネット設定
  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  #NAT-GW作成可否
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

}

# EC2 Instance Connectのエンドポイントを作成
resource "aws_ec2_instance_connect_endpoint" "ec2_connect_endpoint" {
  subnet_id          = module.network.private_subnets[0]
  preserve_client_ip = false
  security_group_ids = [aws_security_group.ec2_connect_endpoint_sg.id]
  tags = {
    "Name" = "${var.vpc_name}-ec2-connect"
  }

  depends_on = [aws_security_group.ec2_connect_endpoint_sg]
}

# EC2 Instance Connectエンドポイント用のSecurityGroup作成
resource "aws_security_group" "ec2_connect_endpoint_sg" {
  name        = "${var.vpc_name}-ec2-connect"
  description = "Managed by Terraform for EC2 Connect Endpoint"
  vpc_id      = module.network.vpc_id

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr_block]
  }

  tags = {
    "Name" = "${var.vpc_name}-ec2-connect"
  }
}
