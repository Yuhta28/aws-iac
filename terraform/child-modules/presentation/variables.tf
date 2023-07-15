variable "remote_network_stack_state" {
  type = string
}

variable "ALB-name" {
  type = string
}

variable "ALB-subnets" {
  type = list(string)
}

variable "web_SG-name" {
  type        = string
  description = "SecurityGroup for ALB"
}

variable "vpc_id" {
  type = string
}