variable "aws_region" {
  description = "Region used to deploy AWS resources"
  default     = "eu-central-1"
  type        = string
}

variable "project_name" {
  description = "Project name used to standarize resources name and tags"
  default     = "testing" # Change this in order to have a naming convention for the resources
  type        = string
}

variable "db_user" {
  description = "User for RDS Database instance"
  default     = "test"
  type        = string
}

variable "db_password" {
  description = "Password for RDS Database instance"
  default     = "54321"
  type        = string
}

variable "domain" {
  description = "Domain name for TLS certificates"
  default     = "example.com" # Change this according to the domain name you need
  type        = string
}

variable "vpc_cidr" {
  description = "VPC-CIDR-block"
  default     = "10.0.0.0/16"
  type        = string
}

variable "public_1a_cidr" {
  description = "subnet public_1a cidr block"
  default     = "10.0.1.0/24"
  type        = string
}

variable "private1_1a_cidr" {
  description = "subnet private1_1a cidr block"
  default     = "10.0.2.0/24"
  type        = string
}

variable "private2_1a_cidr" {
  description = "subnet private2_1a cidr block"
  default     = "10.0.3.0/24"
  type        = string
}

variable "public_1b_cidr" {
  description = "subnet public_1b cidr block"
  default     = "10.0.4.0/24"
  type        = string
}

variable "private1_1b_cidr" {
  description = "subnet private1_1b cidr block"
  default     = "10.0.5.0/24"
  type        = string
}

variable "private2_1b_cidr" {
  description = "subnet private2_1b cidr block"
  default     = "10.0.6.0/24"
  type        = string
}

