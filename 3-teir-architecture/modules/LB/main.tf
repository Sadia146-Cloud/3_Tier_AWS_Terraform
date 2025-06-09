#external load balancer
resource "aws_security_group" "lb_sg" {
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = var.lb_sgname
  }
}

resource "aws_lb" "public_lb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = var.lb_name
  }
}
    
resource "aws_lb_target_group" "public-Tg" {
  name     = "public-my-Tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "public_lb_listner" {
  load_balancer_arn = aws_lb.public_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public-Tg.arn
  }
}


#internal Load balancer
resource "aws_security_group" "internal_lb_sg" {
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = var.private_lb_sgname
  }
}

resource "aws_lb" "private_lb" {
  name               = "my-internal-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.internal_lb_sg.id]
  subnets            = var.private_subnet_ids

  tags = {
    Name = var.internal_lb_name
  }
}
    
resource "aws_lb_target_group" "private-Tg" {
  name     = "private-my-Tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "private_lb_listner" {
  load_balancer_arn = aws_lb.private_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private-Tg.arn
  }
}


#optional manually adding already created instances to target group 
#resource "aws_lb_target_group_attachment" "app" {
  #count            = length(var.instance_ids)
 # target_group_arn = aws_lb_target_group.my_tg.arn
 # target_id        = var.instance_ids[count.index]
  #port             = 80
#}