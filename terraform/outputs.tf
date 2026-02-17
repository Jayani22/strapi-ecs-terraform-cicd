output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "alb_url" {
  value = module.ecs.alb_dns_name
}
