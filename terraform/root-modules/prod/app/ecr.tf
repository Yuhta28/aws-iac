resource "aws_ecr_repository" "nginx" {
  name                 = "prod-ecr-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}