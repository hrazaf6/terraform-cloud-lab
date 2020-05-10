variable "cluster_name" {
  type = string
  default = ""
}

locals {
  instance_port = 80
  lb_port       = 80
}

variable "elb_security_group" {}
variable "asg_id" {}

variable "public_subnets" {}
