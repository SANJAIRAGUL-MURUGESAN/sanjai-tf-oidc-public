output "bucket_name" {
  value = module.s3.bucket_name
}

output "dns_validation_records" {
  value = module.acm_cert.domain_validation_options
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.distribution_id
}

output "aws_cloudwatch_log_group_name" {
  value = module.waf_log_group.aws_cloudwatch_log_group_name
}