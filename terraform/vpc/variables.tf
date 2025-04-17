variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "name_prefix" {
  description = "Name of the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}