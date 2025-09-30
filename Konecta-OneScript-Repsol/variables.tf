variable "aws_profile" { type = string }
variable "aws_region"  { type = string }

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
variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
}
variable "rds_sg_name" {
  description = "RDS security group name tag"
  type        = string
}
variable "database_name" {
  description = "Database name"
  type        = string
}

variable "master_username" {
  description = "Master username" 
  type        = string
}

variable "cluster_identifier" {
  description = "RDS cluster identifier"
  type        = string
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "cluster_name_tag" {
  description = "Name tag for the cluster"
  type        = string
}

variable "subnet_group_name_tag" {
  description = "Name tag for subnet group"
  type        = string
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
}

variable "monitoring_interval" {
  description = "Monitoring interval in seconds"
  type        = number
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
}

variable "preferred_maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "instance_count" {
  description = "Number of RDS instances"
  type        = number
}

variable "writer_instance_name" {
  description = "Name tag for writer instance"
  type        = string
}

variable "reader_instance_name" {
  description = "Name tag for reader instance"
  type        = string
}
variable "tgw_attachment_name" {
  description = "Name tag for Transit Gateway attachment"
  type        = string
}
