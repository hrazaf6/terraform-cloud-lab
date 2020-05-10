variable "instance_type" {
  type = string
  default = ""
}

variable "cluster_name" {
  type = string
  default = ""
}

variable "max_instance_size" {
  type = number
  default = 3
}

variable "min_instance_size" {
  type = number
}

locals {
  instance_port = 80
  lb_port       = 80
  public_ports  = ["22", "80"]
}

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {}




