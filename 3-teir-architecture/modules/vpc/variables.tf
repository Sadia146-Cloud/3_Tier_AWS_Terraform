# VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

# Public Subnet AZ1
variable "psaz1_cidr" {
  description = "CIDR block for public subnet in AZ1"
  type        = string
}

variable "psaz1_availabilityzone" {
  description = "Availability zone for public subnet AZ1"
  type        = string
}

variable "psaz1_name" {
  description = "Name tag for public subnet AZ1"
  type        = string
}

# Public Subnet AZ2
variable "psaz2_cidr" {
  description = "CIDR block for public subnet in AZ2"
  type        = string
}

variable "psaz2_availabilityzone" {
  description = "Availability zone for public subnet AZ2"
  type        = string
}

variable "psaz2_name" {
  description = "Name tag for public subnet AZ2"
  type        = string
}

# Private Subnet AZ1
variable "prsaz1_cidr" {
  description = "CIDR block for private subnet in AZ1"
  type        = string
}

variable "prsaz1_availabilityzone" {
  description = "Availability zone for private subnet AZ1"
  type        = string
}

variable "prsaz1_name" {
  description = "Name tag for private subnet AZ1"
  type        = string
}

# Private Subnet AZ2
variable "prsaz2_cidr" {
  description = "CIDR block for private subnet in AZ2"
  type        = string
}

variable "prsaz2_availabilityzone" {
  description = "Availability zone for private subnet AZ2"
  type        = string
}

variable "prsaz2_name" {
  description = "Name tag for private subnet AZ2"
  type        = string
}

# Internet Gateway
variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
}

# NAT Gateway
variable "nat_name" {
  description = "Name tag for the NAT Gateway"
  type        = string
}

# Route Tables
variable "public_routename" {
  description = "Name tag for the public route table"
  type        = string
}

variable "private_routename" {
  description = "Name tag for the private route table"
  type        = string
}
variable "DB1s_cidr" {
  
}
variable "DB1s_availabilityzone" {
  
}
variable "DB1s_name" {
  
}
variable "DB2s_cidr" {
  
}
variable "DB2s_availabilityzone" {
  
}
variable "DB2s_name" {
  
}
variable "DB_routname" {
  
}