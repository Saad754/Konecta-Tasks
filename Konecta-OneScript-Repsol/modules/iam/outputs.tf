output "trend_micro_role_arn" {
  description = "ARN of the Trend Micro integration role"
  value       = aws_iam_role.trend_micro.arn
}

output "elasticbeanstalk_ec2_role_arn" {
  description = "ARN of the Elastic Beanstalk EC2 role"
  value       = aws_iam_role.elasticbeanstalk_ec2.arn
}

output "rds_monitoring_custom_role_arn" {
  description = "ARN of the custom RDS monitoring role"
  value       = aws_iam_role.rds_monitoring_custom.arn
}
