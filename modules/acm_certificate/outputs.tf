output "cloudfront_distribution_id" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.this.id
}

output "domain_validation_options" {
  description = "List of DNS validation records (to be shared with client)"
  value       = aws_acm_certificate.this.domain_validation_options
}
