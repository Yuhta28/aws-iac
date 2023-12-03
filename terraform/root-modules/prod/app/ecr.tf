module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name = "prod_ecr__nginx"
}