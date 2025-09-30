# RDS Aurora Cluster
resource "aws_rds_cluster" "aurora_repsol" {
  cluster_identifier         = var.cluster_identifier
  engine                    = "aurora-postgresql"
  engine_version            = var.engine_version
  database_name             = var.database_name
  master_username           = var.master_username
  manage_master_user_password = false 
  
  vpc_security_group_ids    = [var.rds_security_group_id]
  db_subnet_group_name      = var.db_subnet_group_name
  
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  
  skip_final_snapshot      = true
  deletion_protection      = true      
  storage_encrypted        = true      
  copy_tags_to_snapshot    = true      
  
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  
  tags = {
    Name     = var.cluster_name_tag
    Platform = var.platform
    Project  = var.project_name
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name     = var.subnet_group_name_tag
    Platform = var.platform
    Project  = var.project_name
  }
}

# RDS Cluster Instances
resource "aws_rds_cluster_instance" "aurora_repsol_instances" {
  count              = var.instance_count
  identifier         = "aurora-repsol-node-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora_repsol.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora_repsol.engine
  engine_version     = aws_rds_cluster.aurora_repsol.engine_version
  
  copy_tags_to_snapshot = true          
  monitoring_interval   = var.monitoring_interval
  force_destroy        = false          
  
  tags = {
    Name     = count.index == 0 ? var.writer_instance_name : var.reader_instance_name
    Platform = var.platform
    Project  = var.project_name
  }
}
