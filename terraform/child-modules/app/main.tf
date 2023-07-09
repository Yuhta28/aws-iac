module "ecs_cluster" {
    source = "terraform-aws-modules/ecs/aws//modules/cluster"

    cluster_name = var.cluster_name
    cluster_settings = {
        name  = "containerInsights"
        value = "disabled"
    }
}