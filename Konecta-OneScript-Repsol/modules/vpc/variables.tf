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

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "private_subnet_names" {
  description = "Names for private subnets"
  type        = list(string)
}

variable "public_subnet_names" {
  description = "Names for public subnets"
  type        = list(string)
}
variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
}
variable "tgw_attachment_name" {
  description = "Name tag for Transit Gateway attachment"
  type        = string
}
