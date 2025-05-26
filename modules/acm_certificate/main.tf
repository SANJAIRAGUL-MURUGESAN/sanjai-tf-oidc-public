resource "aws_acm_certificate" "this" {
  domain_name               = var.primary_domain
  subject_alternative_names = var.alternative_domains
  validation_method         = "DNS"
  provider                  = aws.us_east_1

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}
