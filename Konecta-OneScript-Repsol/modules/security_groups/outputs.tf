output "prueba_sg_id" {
  description = "ID of the prueba security group"
  value       = aws_security_group.prueba.id
}

output "rds_repsol_sg_id" {
  description = "ID of the RDS security group"  
  value       = aws_security_group.rds_repsol_sg.id
}
