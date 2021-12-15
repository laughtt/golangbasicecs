

resource "aws_cloudwatch_log_group" "ecs_task_logs" {
  name = "${local.prefix}-api"

  tags = local.common_tags
}

data "template_file" "api_container_definitions" {
  template = file("./templates/ecs/container-definitions.json.tpl")

  vars = {
    container_name     = "${local.prefix}-api"
    container_port     = var.container_port
    memory_reservation = var.memory_reservation
    app_image          = "${var.repo_url}:latest"
    db_host            = var.db_host
    db_name            = var.db_name
    db_user            = var.db_user
    db_pass            = var.db_pass
    log_group_name     = aws_cloudwatch_log_group.ecs_task_logs.name
    log_group_region   = data.aws_region.current.name
  }
}

resource "aws_ecs_task_definition" "api" {
  family                   = "${local.prefix}-api"
  container_definitions    = data.template_file.api_container_definitions.rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.memory_reservation
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.app_iam_role.arn

  tags = local.common_tags
}


resource "aws_ecs_service" "api" {
  name            = "${local.prefix}-api"
  cluster         = data.terraform_remote_state.remote.outputs.ecs_cluster_name
  task_definition = aws_ecs_task_definition.api.family
  desired_count   = var.desire_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.terraform_remote_state.remote.outputs.vpc_id_private_subnets_cidr_blocks_ids
    security_groups = [aws_security_group.ecs_service.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.api.arn
    container_name   = "${local.prefix}-api"
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.api]
}
