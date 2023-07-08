
variable "remote_network_stack_state" {
  type = string
}

variable "web_SG-name" {
  type        = string
  description = "SecurityGroup for ALB"
}

variable "vpc_id" {
  type = string
}