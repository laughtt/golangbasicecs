

resource "aws_api_gateway_resource" "root" {
  path_part   = var.resource_api_gateway_path
  parent_id   = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api_root_resource_id
  rest_api_id = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
}

resource "aws_api_gateway_method" "root_method" {
  rest_api_id   = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
  resource_id   = aws_api_gateway_resource.root.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration_root" {
  rest_api_id             = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
  resource_id             = aws_api_gateway_resource.root.id
  http_method             = aws_api_gateway_method.root_method.http_method
  integration_http_method = "ANY"
  type                    = "HTTP_PROXY"
  uri                     = "http://${data.terraform_remote_state.remote.outputs.lb_dns}:${var.lb_listener_port}"
  connection_type         = "VPC_LINK"
  connection_id           = data.terraform_remote_state.remote.outputs.aws_api_gateway_vpc_link
}

resource "aws_api_gateway_resource" "resource" {
  path_part   = "{proxy+}"
  parent_id   = aws_api_gateway_resource.root.id
  rest_api_id = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "ANY"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.proxy" = true
  }
}
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = "ANY"
  type                    = "HTTP_PROXY"
  request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
  uri             = "http://${data.terraform_remote_state.remote.outputs.lb_dns}:${var.lb_listener_port}/{proxy}"
  connection_type = "VPC_LINK"
  connection_id   = data.terraform_remote_state.remote.outputs.aws_api_gateway_vpc_link
}


resource "aws_api_gateway_deployment" "MyDemoDeployment" {
  depends_on = [
    aws_api_gateway_integration.integration
  ]
  rest_api_id = data.terraform_remote_state.remote.outputs.aws_api_gateway_rest_api
  stage_name  = "basic-test-deployment"

  triggers = {
    redeployment = sha1(join(",", list(
      jsonencode(aws_api_gateway_integration.integration), jsonencode(aws_api_gateway_integration.integration_root),
    )))
  }

  lifecycle {
    create_before_destroy = true
  }
}