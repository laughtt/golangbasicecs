
resource "aws_api_gateway_rest_api" "api" {
  name = "main-apigateway"
  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}
resource "aws_api_gateway_vpc_link" "nlb_vpc_link" {
  name        = "elb-vpc-link"
  description = "main-vpc-link"
  target_arns = [module.nlb.this_lb_arn]
  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}