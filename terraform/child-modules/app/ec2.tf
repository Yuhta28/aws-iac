module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.ec2_name

  instance_type          = "t2.micro"
  ami                    = data.aws_ami.ubuntu.id
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = data.terraform_remote_state.remote_network_stack_state.outputs.VPC_PrivateSubnets[0]
}

## EC2アタッチ用セキュリティグループ
resource "aws_security_group" "ec2_sg" {
  name        = "${var.ec2_name}-ec2"
  description = "Managed by Terraform for EC2"
  vpc_id      = data.terraform_remote_state.remote_network_stack_state.outputs.VPC_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = data.terraform_remote_state.remote_network_stack_state.outputs.ec2_connect_endpoint.security_group_ids
  }
  #  ingress {
  #    from_port       = 80
  #    to_port         = 80
  #    protocol        = "tcp"
  #    security_groups = [module.ec2_alb.security_group_id]
  #  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.ec2_name}-ec2"
  }
}



### Ubuntu 
### UbuntuはパラメータストアにEC2に適したAMI情報がないためAMI IDを検索して取得
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  #Ubuntu 20.04系か22.04系を指定
  filter {
    name = "name"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"] #20.04
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*"] #22.04
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  ##CPUアーキテクチャがAMDかARMを指定
  filter {
    name   = "architecture"
    values = ["x86_64"] #amd
    #values = ["arm64"]  #arm64
  }
}