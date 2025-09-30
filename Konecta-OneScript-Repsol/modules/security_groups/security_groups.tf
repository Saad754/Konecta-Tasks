# Custom Security Group 1: prueba
resource "aws_security_group" "prueba" {
  name                   = "prueba"
  description            = "launch-wizard-1 created 2025-06-23T19:20:53.756Z"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = false

}

# Custom Security Group 2: rds_repsol_sg  
resource "aws_security_group" "rds_repsol_sg" {
  name                   = "rds_repsol_sg"
  description            = "Security group for RDS Aurora PostgreSQL"
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = false

  tags = {
    Name     = var.rds_sg_name
    Platform = var.platform  
    Project  = var.project_name
    }

}
