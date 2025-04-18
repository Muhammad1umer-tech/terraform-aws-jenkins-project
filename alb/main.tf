resource "aws_lb_target_group" "custom_tg" {
  name     = "custom-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.custom_vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "5000"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "ec2_a" {
  target_group_arn = aws_lb_target_group.custom_tg.arn
  target_id        = var.custom_instance_id
  port             = 5000
}


resource "aws_lb" "custom_alb" {
  name               = "custom-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.custom_sg_id]
  subnets            = var.public_subnet_ids

  tags = {
    Environment = "custom-alb"
  }
}

resource "aws_lb_listener" "custom_alb_listner" {
  load_balancer_arn = aws_lb.custom_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.custom_tg.arn
  }
}
