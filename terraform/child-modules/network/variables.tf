variable "vpc_name" {
  type        = string
  description = "VPC resource name"
}

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR"
}

variable "azs" {
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  description = "Available Zones"
}

variable "public_subnets" {
  type        = list(string)
  default     = null
  description = "Public Subnets"
}

variable "private_subnets" {
  type        = list(string)
  default     = null
  description = "Private Subnets"
}

variable "database_subnets" {
  type        = list(string)
  default     = null
  description = "Database Subnets"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "NAT-GW作成"
}

variable "single_nat_gateway" {
  type        = bool
  default     = false
  description = "VPC内にNAT-GWを一つだけ作成する"
}