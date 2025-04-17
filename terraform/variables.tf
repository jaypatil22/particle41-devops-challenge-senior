variable "region" {
  description = "AWS region to be used to deploy the resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "name_prefix" {
  description = "Name of the VPC"
  type        = string
}

variable "image_uri" {
  description = "application docker image URI"
  type        = string
}