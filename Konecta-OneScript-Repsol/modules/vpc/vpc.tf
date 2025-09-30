resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block  
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name     = var.vpc_name
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Private Subnets
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[0]  
  availability_zone = "eu-west-1a"

  tags = {
    Name     = var.private_subnet_names[0]
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[1]  
  availability_zone = "eu-west-1b"

  tags = {
    Name     = var.private_subnet_names[1]
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Public Subnets
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[0]  
  availability_zone       = "eu-west-1a"

  tags = {
    Name     = var.public_subnet_names[0]
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[1]  
  availability_zone       = "eu-west-1b"

  tags = {
    Name     = var.public_subnet_names[1]
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name     = var.igw_name 
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}


# Route Tables

# Public Route Table 1 (for subnet 1a)
resource "aws_route_table" "public_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name     = "RT-Public1"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Public Route Table 2 (for subnet 1b) 
resource "aws_route_table" "public_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name     = "RT-Public2"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}
# Private Route Tables

# Private Route Table 1 (for subnet 1a)
resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_1.id
  }

  route {
    cidr_block = "172.15.9.7/32"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.177.179.9/32"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.133.46.0/26"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.133.46.64/26"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "172.15.0.0/16"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  tags = {
    Name     = "RT-Private1"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Private Route Table 2 (for subnet 1b)
resource "aws_route_table" "private_1b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_2.id
  }

  route {
    cidr_block = "172.15.9.7/32"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.177.179.9/32"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.133.46.0/26"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "10.133.46.64/26"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  route {
    cidr_block = "172.15.0.0/16"
    transit_gateway_id = "tgw-0f6739e2525074a0a"
  }

  tags = {
    Name     = "RT-Private2"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# Private Route Table Associations
resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_1a.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.private_1b.id
}


# Route Table Associations
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_1a.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public_1b.id
}
# Elastic IPs for NAT Gateways
resource "aws_eip" "nat_1" {
  domain = "vpc"

  tags = {
    Name     = "EIP-one-script-repsol-1"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

resource "aws_eip" "nat_2" {
  domain = "vpc"

  tags = {
    Name     = "EIP-one-script-repsol-2"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}

# NAT Gateways
resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.nat_1.id
  subnet_id     = aws_subnet.public_1a.id

  tags = {
    Name     = "NAT-one-script-repsol-1"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "nat_2" {
  allocation_id = aws_eip.nat_2.id
  subnet_id     = aws_subnet.public_1b.id

  tags = {
    Name     = "NAT-one-script-repsol-2"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }

  depends_on = [aws_internet_gateway.main]
}
resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id
  subnet_ids             = [
           "subnet-00f9597a2cf56150c",
           "subnet-08c44f4126a279ef8",
           "subnet-0d2be15196c4603e2",
           "subnet-0f3b33d3459cbb5ca",
        ]

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"  
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name     = "ACL-one-script-repsol-Default"
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}
# Transit Gateway VPC Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  subnet_ids         = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]
  transit_gateway_id = "tgw-0f6739e2525074a0a"  # The shared TGW
  vpc_id             = aws_vpc.main.id

  tags = {
    Name     = var.tgw_attachment_name
    Country  = var.country
    Platform = var.platform
    Project  = var.project_name
  }
}
