variable "name_prefix" {
  description = "Prefix to be used while naming resouces"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ID of ALB SG"
  type        = string
}

variable "image_uri" {
  description = "Image URI of the application docker image"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "alb_listener" {
  description = "ALB listner"
}