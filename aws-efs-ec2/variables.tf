## AWS Region & Availability Zones

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone_1" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-east-1b"
}


## VPC: CIDR Blocks

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vpc_subnet_cidr_1" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.10.0.0/24"
}

variable "vpc_subnet_cidr_2" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.10.1.0/24"
}


## VPC Name

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "Example-VPC"
}


## SSH Key and EC2 Image

# SSH key pair name
variable "key_name" {
  default = "us-east-1-pc-le" # Define key pair name
}

# EC2 Image ID
variable "ami_id" {
  default = "ami-0e2c8caa4b6378d8c" # Define EC2 AMI ID
}