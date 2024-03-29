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
