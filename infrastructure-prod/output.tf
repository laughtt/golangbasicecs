output "vpc_id" {
  value       = module.vpc.vpc_id
  description = ""
}
output "ecs_cluster_arn" {
  value       = module.ecs.this_ecs_cluster_arn
  description = ""
}
output "ecs_cluster_id" {
  value       = module.ecs.this_ecs_cluster_id
  description = ""
}
output "aws_api_gateway_rest_api" {
  value       = aws_api_gateway_rest_api.api.id
  description = ""
}
output "aws_api_gateway_rest_api_root_resource_id" {
  value       = aws_api_gateway_rest_api.api.root_resource_id
  description = ""
}
output "lb_arn" {
  value       = module.nlb.this_lb_arn
  description = ""
}
output "lb_dns" {
  value       = module.nlb.this_lb_dns_name
  description = ""
}
output "vpc_id_private_subnets_cidr_blocks" {
  value       = module.vpc.private_subnets_cidr_blocks
  description = ""
}
output "vpc_id_public_subnets_cidr_blocks" {
  value       = module.vpc.public_subnets_cidr_blocks
  description = ""
}
output "ecs_cluster_name" {
  value       = module.ecs.this_ecs_cluster_name
  description = ""
}
output "network_load_balancer" {
  value       = module.ecs.this_ecs_cluster_name
  description = ""
}
output "vpc_id_public_subnets_cidr_blocks_ids" {
  value       = module.vpc.public_subnets
  description = ""
}

output "vpc_id_private_subnets_cidr_blocks_ids" {
  value       = module.vpc.private_subnets
  description = ""
}

output "aws_api_gateway_vpc_link" {
  value       = aws_api_gateway_vpc_link.nlb_vpc_link.id
  description = ""
}
output "root_resource_id" {
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "aws_ecr_repository" {
  value = aws_ecr_repository.app-repo.registry_id
}
output "aws_ecr_repository_url" {
  value = aws_ecr_repository.app-repo.repository_url
}