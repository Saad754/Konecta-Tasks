output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]
}

output "public_subnet_ids" {
  description = "IDs of the public subnets" 
  value       = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}
output "public_route_table_1a_id" {
  description = "ID of the public route table 1a"
  value       = aws_route_table.public_1a.id
}

output "public_route_table_1b_id" {
  description = "ID of the public route table 1b" 
  value       = aws_route_table.public_1b.id
}
