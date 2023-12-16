module "prod-app" {
  source                          = "../../../child-modules/app"
  remote_presentation_stack_state = "aws-terraform-presentation-prod"
  cluster_name                    = "Prod-frontend"
  ec2_name                        = "test_instance"
}
