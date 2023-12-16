module "prod-app" {
  source                          = "../../../child-modules/app"
  remote_presentation_stack_state = "aws-terraform-presentation-prod"
  remote_network_stack_state      = "aws-terraform-nw-prod"
  cluster_name                    = "Prod-frontend"
  ec2_name                        = "test_datadog_instance"
}