output "bucket_id" {
  value = aws_s3_bucket.frontend.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.frontend.bucket_regional_domain_name
}

output "bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.this.arn
}
