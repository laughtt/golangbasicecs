module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "main-nlb-internal"

  load_balancer_type = "network"
  internal           = true
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.private_subnets

  tags = merge(
    local.common_tags,
    tomap("Name", "${local.prefix}")
  )
}