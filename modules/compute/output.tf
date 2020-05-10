output "elb_security_group" {
  value = aws_security_group.default.id
}

output "asg_id" {
  value = aws_autoscaling_group.default.id
}
