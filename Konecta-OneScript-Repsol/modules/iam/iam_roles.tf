# Trend Micro Integration Role
resource "aws_iam_role" "trend_micro" {
  name        = "ROLE-Trend-micro"
  description = "Role creado para realizar la integración con la consola centralizada de Trend micro"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::147995105371:root"
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = "CE45CC65-CB9F-74CC-EB29-45D59D0B35DF"
          }
        }
      }
    ]
  })

  tags = {
    Name     = "POLICY-Trend-micro"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Elastic Beanstalk EC2 Instance Role
resource "aws_iam_role" "elasticbeanstalk_ec2" {
  name = "ROLE-aws-elasticbeanstalk-ec2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name     = "ROLE-aws-elasticbeanstalk-ec2"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Custom RDS Monitoring Role
resource "aws_iam_role" "rds_monitoring_custom" {
  name = "ROLE-rds-monitoring-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name     = "ROLE-rds-monitoring-role"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}
