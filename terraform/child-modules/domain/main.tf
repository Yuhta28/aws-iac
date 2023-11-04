resource "aws_route53_zone" "hostzone" {
  name = var.domain_name
}