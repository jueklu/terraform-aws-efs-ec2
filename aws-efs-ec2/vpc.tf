# VPC
resource "aws_vpc" "vpc" {
  provider = aws.aws_region
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name       = "${var.vpc_name}"
    Env        = "Production"
  }
}


# Public Subnet "10.10.0.0/24"
resource "aws_subnet" "vpc_subnet_public1" {
  provider = aws.aws_region
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_cidr_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.vpc_name} Subnet-Public-1"
    Env       = "Production"
  }
}

# Public Subnet "10.11.0.0/24"
resource "aws_subnet" "vpc_subnet_public2" {
  provider = aws.aws_region
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.vpc_subnet_cidr_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name      = "${var.vpc_name} Subnet-Public-2"
    Env       = "Production"
  }
}


# Internet Gateway
resource "aws_internet_gateway" "vpc_igw" {
  provider = aws.aws_region
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.vpc_name} IGW"
    Env         = "Production"
  }
}


# Public Routing Table
resource "aws_route_table" "vpc_public_routetable" {
  provider = aws.aws_region
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }

  tags = {
    Name        = "${var.vpc_name} Public Route Table"
    Env         = "Production"
  }
}


# Associate Routes with Subnets
resource "aws_route_table_association" "vpc_subnet_public1_ra" {
  provider = aws.aws_region
  subnet_id      = aws_subnet.vpc_subnet_public1.id
  route_table_id = aws_route_table.vpc_public_routetable.id
}

# Associate Routes with Subnets
resource "aws_route_table_association" "vpc_subnet_public2_ra" {
  provider = aws.aws_region
  subnet_id      = aws_subnet.vpc_subnet_public2.id
  route_table_id = aws_route_table.vpc_public_routetable.id
}