output "SG_Web_Info" {
  value = module.security-group_web
}

data "terraform_remote_state" "pool_presentation_stack_state" {
  backend = "remote"
  config = {
    hostname = "spacelift.io"
    organization = "yuhta28"
    workspaces = {
      name = "AWS-Terraform-Presentation-Prod"
    }
  }
}

output "stack_state" {
  value  = data.terraform_remote_state.pool_presentation_stack_state
}