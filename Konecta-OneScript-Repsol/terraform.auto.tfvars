aws_profile = "konecta"
aws_region  = "eu-west-1"


project_name = "OneScript Repsol"
country      = "Espana"
platform     = "Terraform"

vpc_name = "10.133.72.0/25-VPC-one-script-repsol"

private_subnet_names = [
  "10.133.72.0/27-Private1-eu-west-1a",
  "10.133.72.32/27-Private2-eu-west-1b"
]
public_subnet_names = [
  "10.133.72.64/27-Public1-eu-west-1a",
  "10.133.72.96/27-Public2-eu-west-1b"
]

vpc_cidr_block = "10.133.72.0/25"
private_subnet_cidrs = [
  "10.133.72.0/27",   # Private1 eu-west-1a
  "10.133.72.32/27"   # Private2 eu-west-1b
]
public_subnet_cidrs = [
  "10.133.72.64/27",  # Public1 eu-west-1a  
  "10.133.72.96/27"   # Public2 eu-west-1b
]
igw_name = "IGW-one-script-repsol"
rds_sg_name = "rds-repsol-sg"
database_name    = "repsol_db"      
master_username  = "repsol_user"    

# RDS variables 
cluster_identifier          = "rds-cluster-repsol"
engine_version             = "15.12"
db_subnet_group_name       = "subnet-group-rds-repsol"
cluster_name_tag           = "Aurora RDS Cluster Repsol"
subnet_group_name_tag      = "subnet-group-rds-repsol"
backup_retention_period    = 7
monitoring_interval        = 60
preferred_backup_window    = "07:00-09:00"
preferred_maintenance_window = "sun:03:00-sun:04:00"
enabled_cloudwatch_logs_exports = ["postgresql"]
instance_class             = "db.t4g.large"
instance_count            = 2
writer_instance_name      = "Aurora RDS Instance Writer Repsol"
reader_instance_name      = "Aurora RDS Instance Reader Repsol"
tgw_attachment_name = "TGW-Attach-Irlanda-core" 
