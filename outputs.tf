output "bucket_name" {
  value = module.s3.bucket_name
}

output "dns_validation_records" {
  value = module.acm_cert.domain_validation_options
}