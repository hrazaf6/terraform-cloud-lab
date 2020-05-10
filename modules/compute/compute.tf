resource "aws_launch_configuration" "launchc" {
  image_id          = "ami-085925f297f89fce1"
  instance_type     = var.instance_type
  name              = format("%s-lc", var.cluster_name)
  security_groups   = [aws_security_group.default.id]
  key_name          = "ec2"
  user_data         = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "user_data" {
    template = file("${path.module}/user_data.sh")
}

resource "aws_autoscaling_group" "default" {
  name                 = format("%s-asg", var.cluster_name)
  max_size             = var.max_instance_size
  min_size             = var.min_instance_size
  launch_configuration = aws_launch_configuration.launchc.name
  vpc_zone_identifier  = var.private_subnets
}