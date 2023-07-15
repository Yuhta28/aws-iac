terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "prod-app" {
  source       = "../../../child-modules/app"
  cluster_name = "Prod-frontend"
  service_name = "Prod-PhpApp"
  task_def     = "aws-ecs-sample:1"
}
