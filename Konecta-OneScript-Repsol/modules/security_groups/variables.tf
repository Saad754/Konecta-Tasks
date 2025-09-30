variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "country" {
  description = "Country tag"
  type        = string
}

variable "platform" {
  description = "Platform tag"
  type        = string
}
variable "rds_sg_name" {
  description = "RDS security group name tag"
  type        = string
}
