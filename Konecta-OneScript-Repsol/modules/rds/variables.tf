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

variable "subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

# String variables for RDS configuration
variable "cluster_identifier" {
  description = "RDS cluster identifier"
  type        = string
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
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

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "cluster_name_tag" {
  description = "Name tag for the cluster"
  type        = string
}

variable "subnet_group_name_tag" {
  description = "Name tag for the DB subnet group"
  type        = string
}

# Number variables
variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
}

variable "monitoring_interval" {
  description = "Monitoring interval in seconds"
  type        = number
}

variable "instance_count" {
  description = "Number of RDS instances in cluster"
  type        = number
}

# String variables for time windows
variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
}

variable "preferred_maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
}

# List variables
variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "writer_instance_name" {
  description = "Name tag for writer instance"
  type        = string
}

variable "reader_instance_name" {
  description = "Name tag for reader instance"
  type        = string
}
