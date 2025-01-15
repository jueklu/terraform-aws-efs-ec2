# EC2 Instance in Public Subnet 1
resource "aws_instance" "ec2_public_subnet1" {
  provider = aws.aws_region
  ami                    = var.ami_id
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.vpc_subnet_public1.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  depends_on = [
    aws_vpc.vpc,
    aws_security_group.ec2_sg,
    aws_efs_file_system.efs_filesystem,
    aws_efs_mount_target.efs_mount_target1
    ]

  tags = {
    Name = "public-subnet-vm-1"
    Env  = "Production"
  }
}


# EC2 Instance in Public Subnet 2
resource "aws_instance" "ec2_public_subnet2" {
  provider = aws.aws_region
  ami                    = var.ami_id
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.vpc_subnet_public2.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  depends_on = [
    aws_vpc.vpc,
    aws_security_group.ec2_sg,
    aws_efs_file_system.efs_filesystem,
    aws_efs_mount_target.efs_mount_target2
    ]

  tags = {
    Name = "public-subnet-vm-2"
    Env  = "Production"
  }
}