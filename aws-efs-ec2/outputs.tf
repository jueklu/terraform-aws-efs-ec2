# EC2 Instance public IP
output "Public_Instance1_Public_IP" {
  description = "Public IP address of the EC2 instance in the public subnet"
  value       = aws_instance.ec2_public_subnet1.public_ip
}

# EC2 Instance public IP
output "Public_Instance2_Public_IP" {
  description = "Public IP address of the EC2 instance in the public subnet"
  value       = aws_instance.ec2_public_subnet2.public_ip
}


# EFS File System ID
output "EFS_File_System_ID" {
  value = aws_efs_file_system.efs_filesystem.id
  description = "The ID of the EFS file system"
}