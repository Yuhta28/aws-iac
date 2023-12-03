#output "Frontend_cluster_info" {
#  value = module.prod-app.ecs_frontend_cluster
#}

#output "Frontend_service_info" {
#  value = module.prod-app.ecs_frontend_service
#}
output "ecr_info" {
  value = aws_ecr_repository.nginx
}