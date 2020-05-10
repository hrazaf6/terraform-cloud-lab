variable "cidr_block" {
  default = "172.18.0.0/16"
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true 
}

variable "vpc_name" {
  default = "Management-VPC"
}

variable "environment" {
  default = "dev"
}

variable "public_subnet_names" {
  default = ["Public_First", "Public_Second"]
}

variable "private_subnet_names" {
  default = ["Private_First", "Private_Second"]
}

