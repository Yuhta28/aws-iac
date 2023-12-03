module "ecs_frontend_cluster" {
  source = "terraform-aws-modules/ecs/aws//modules/cluster"

  cluster_name = var.cluster_name
  cluster_settings = {
    name  = "containerInsights"
    value = "enabled"
  }

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }

  cloudwatch_log_group_retention_in_days = 7

  create_task_exec_iam_role = true
  task_exec_iam_role_name   = "${var.cluster_name}-task-exec-"
}

#module "ecs_frontend_service" {
#  source = "terraform-aws-modules/ecs/aws//modules/service"
#
#  name        = var.service_name
#  cluster_arn = module.ecs_frontend_cluster.arn
#
#  cpu    = 1024
#  memory = 4096
#
#  family = var.task_def
#}
