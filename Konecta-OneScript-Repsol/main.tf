module "vpc" {
  source               = "./modules/vpc"
  project_name         = var.project_name
  country              = var.country
  platform             = var.platform
  vpc_cidr_block       = var.vpc_cidr_block
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  vpc_name             = var.vpc_name
  private_subnet_names = var.private_subnet_names
  public_subnet_names  = var.public_subnet_names
  igw_name             = var.igw_name
  tgw_attachment_name = var.tgw_attachment_name

}

# Add Security Groups module
module "security_groups" {
  source       = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  country      = var.country
  platform     = var.platform
  rds_sg_name  = var.rds_sg_name
}
module "rds" {
  source                      = "./modules/rds"
  project_name               = var.project_name
  country                    = var.country
  platform                   = var.platform
  subnet_ids                 = module.vpc.private_subnet_ids
  rds_security_group_id      = module.security_groups.rds_repsol_sg_id
  cluster_identifier         = var.cluster_identifier
  engine_version             = var.engine_version
  database_name              = var.database_name
  master_username            = var.master_username
  db_subnet_group_name       = var.db_subnet_group_name
  cluster_name_tag           = var.cluster_name_tag
  subnet_group_name_tag      = var.subnet_group_name_tag
  backup_retention_period    = var.backup_retention_period
  monitoring_interval        = var.monitoring_interval
  preferred_backup_window    = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  instance_class             = var.instance_class
  instance_count            = var.instance_count
  writer_instance_name       = var.writer_instance_name
  reader_instance_name       = var.reader_instance_name
}

module "iam" {
  source = "./modules/iam"
  
  project_name = var.project_name
  country      = var.country
  platform     = var.platform
}
