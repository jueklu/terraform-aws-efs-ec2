# EFS File System
resource "aws_efs_file_system" "efs_filesystem" {
  creation_token = "efs-ec2"
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  depends_on = [aws_vpc.vpc]

  tags = {
    Name = "EFS for EC2"
  }
}


# Mount Target in Subnet 1
resource "aws_efs_mount_target" "efs_mount_target1" {
  file_system_id  = aws_efs_file_system.efs_filesystem.id
  subnet_id       = aws_subnet.vpc_subnet_public1.id
  security_groups = [aws_security_group.efs_sg.id]

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.vpc_subnet_public1,
    aws_security_group.efs_sg,
    aws_efs_file_system.efs_filesystem
    ]
}

# Mount Target in Subnet 2
resource "aws_efs_mount_target" "efs_mount_target2" {
  file_system_id  = aws_efs_file_system.efs_filesystem.id
  subnet_id       = aws_subnet.vpc_subnet_public2.id
  security_groups = [aws_security_group.efs_sg.id]

  depends_on = [
    aws_vpc.vpc,
    aws_subnet.vpc_subnet_public2,
    aws_security_group.efs_sg,
    aws_efs_file_system.efs_filesystem
    ]
}