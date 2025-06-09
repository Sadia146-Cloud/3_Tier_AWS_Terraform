#external ASG
resource "aws_launch_template" "ASG-temp" {
  name_prefix   = "asg-ins"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name = var.keypair

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.securitygroup_id]
  }
}

resource "aws_autoscaling_group" "my_asg" {
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  vpc_zone_identifier = var.public_subnet_ids


  launch_template {
    id      = aws_launch_template.ASG-temp.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}

#internal ASG
resource "aws_launch_template" "private_ASG-temp" {
  name_prefix   = "private_asg-ins"
  image_id      = var.private_ami
  instance_type = var.instance_type
  key_name = var.keypair

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [var.private_securitygroup_id]
  }
}

resource "aws_autoscaling_group" "private_my_asg" {
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2

  vpc_zone_identifier = var.private_subnet_ids


  launch_template {
    id      = aws_launch_template.private_ASG-temp.id
    version = "$Latest"
  }

  target_group_arns = [var.internal_target_group_arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}