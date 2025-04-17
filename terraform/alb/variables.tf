variable "vpc_id" {
  description = "VPC ID of the VPC to be used"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to be used in resouce names"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets to be used for launching ALB"
  type        = list(string)
}
