module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "2.3.0"
  name    = "main-ecs-cluster"
  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}")
  )
}