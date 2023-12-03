resource "aws_route53_zone" "hostzone" {
  name = var.domain_name
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.hostzone.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "*.${var.domain_name}"
  ]

  validation_timeout = "10m"

  tags = {
    Name = var.domain_name
  }
}