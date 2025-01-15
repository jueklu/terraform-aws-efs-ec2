# vpc: Security Group for SSH Access and Ping
resource "aws_security_group" "ec2_sg" {
  provider = aws.aws_region
  name        = "SG"
  description = "Security group for SSH access and ping"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow ping"
    from_port   = 8
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.vpc]

  tags = {
    Name = "SG"
    Env  = "Production"
  }
}


# Security Group for EFS Mount Targets
resource "aws_security_group" "efs_sg" {
  provider    = aws.aws_region
  name        = "EFS-SG"
  description = "Security group for EFS access"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow NFS traffic from EC2 instances"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.vpc]

  tags = {
    Name = "EFS SG"
    Env  = "Production"
  }
}