resource "aws_elb" "loadbalancer" {
    name                = format("%s-elb", var.cluster_name)
    subnets             = [var.public_subnets]
    security_groups     = [var.elb_security_group]
    listener {
      instance_port     = local.instance_port
      instance_protocol = "http"
      lb_port           = local.lb_port
      lb_protocol       = "http"
    }
    health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 3
      target              = "HTTP:80/"
      interval            = 30
    }
}


resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = var.asg_id
  elb                    = aws_elb.loadbalancer.id
}