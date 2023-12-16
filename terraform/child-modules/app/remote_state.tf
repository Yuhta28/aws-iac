data "terraform_remote_state" "remote_network_stack_state" {
  backend = "remote"
  config = {
    hostname     = "spacelift.io"
    organization = "yuhta28"
    workspaces = {
      name = var.remote_network_stack_state
    }
  }
}

output "remote_network_stack_state" {
  value = data.terraform_remote_state.remote_network_stack_state
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