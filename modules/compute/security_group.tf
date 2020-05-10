resource "aws_security_group" "default" {
  name   = format("%s-sg", var.cluster_name)
  vpc_id = var.vpc_id
  dynamic "ingress" {
      iterator = port
      for_each = local.public_ports
      content {
        from_port = port.value 
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}