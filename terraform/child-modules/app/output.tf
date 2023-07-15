output "ecs_frontend_cluster" {
  value = module.ecs_frontend_cluster
}

output "ecs_frontend_service" {
  value = module.ecs_frontend_service
}

data "terraform_remote_state" "remote_presentation_stack_state" {
  backend = "remote"
  config = {
    hostname     = "spacelift.io"
    organization = "yuhta28"
    workspaces = {
      name = var.remote_presentation_stack_state
    }
  }
}

output "remote_presentation_stack_state" {
  value = data.terraform_remote_state.remote_presentation_stack_state
}