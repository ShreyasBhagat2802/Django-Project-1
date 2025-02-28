# Variables For VPC infrastructure
variable "region" {
  default = "eu-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for Public Subnet 1"
  type        = string
  default     = "10.0.0.0/22"
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for Public Subnet 2"
  type        = string
  default     = "10.0.4.0/22"
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for Private Subnet 1"
  type        = string
  default     = "10.0.8.0/22"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for Private Subnet 2"
  type        = string
  default     = "10.0.12.0/22"
}

variable "availability_zone_1" {
  description = "Availability Zone for Subnet 1"
  type        = string
  default     = "eu-west-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for Subnet 2"
  type        = string
  default     = "eu-west-1b"
}

variable "ami" {
  description = "EC2 Instance ami"
  default     = "ami-03fd334507439f4d1"
}


variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t3.medium"
}

variable "access_key" {
  description = "Kay Pair for ssh"
  default     = "Django_access_key"
}

variable "rds_db_name" {
  type    = string
  default = "myrdsdb"
}

variable "rds_username" {
  type    = string
  default = "admin"
}

variable "rds_password" {
  type    = string
  default = "Shreyas28"
}

variable "environment" {
  description = "Environment (dev, beta, prod)"
  type        = string
}
