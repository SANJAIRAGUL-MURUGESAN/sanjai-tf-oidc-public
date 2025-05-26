terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_acm_certificate" "this" {
  domain_name               = var.primary_domain
  subject_alternative_names = var.alternative_domains
  validation_method         = "DNS"
  # provider                  = var.aws

  lifecycle {
    create_before_destroy = true
  }

  tags = var.acm_tags
}
