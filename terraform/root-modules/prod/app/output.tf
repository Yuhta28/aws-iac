output "Frontend_cluster_info" {
  value = module.prod-app.ecs_frontend_cluster
}

output "Frontend_service_info" {
  value = module.prod-app.ecs_frontend_service
}