resource "aws_lb_target_group" "api" {
  name        = "${local.prefix}-api"
  protocol    = "TCP"
  vpc_id      = data.terraform_remote_state.remote.outputs.vpc_id
  target_type = "ip"
  port        = var.container_port
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
  health_check {
    path = var.health_check_path
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = data.terraform_remote_state.remote.outputs.lb_arn
  port              = var.lb_listener_port
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }
}