// Variables for Certificate Manager

variable "acm_region" {
  type = string
  description = "Provider for AWS Certificate Manager to issue a certificate"
  default = "us-east-1"
}

variable "primary_domain" {
  description = "Primary domain name for the certificate (e.g., www.example.com)"
  type        = string
}

variable "alternative_domains" {
  description = "List of alternative domain names (SANs)"
  type        = list(string)
  default     = []
}

variable "acm_tags" {
  type        = map(string)
  description = "Tags to apply to s3 Bucket"
}

// Variables for s3
# variable "aws_region" {
#   description = "AWS region"
#   type        = string
#   default     = "us-east-1"
# }

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default = "sanjai-oidc"
}

variable "object_ownership" {
  description = "Ownership of the project"
  type = string
}

variable "versioning_configuration" {
  description = "Boolean Value fot Bucket Versioning Configuration"
  type = string
}

variable "s3_tags" {
  type        = map(string)
  description = "Tags to apply to s3 Bucket"
}


// Variables for OAC

variable "oac_name" {
  type = string
  description = "Name of the Open Control Access"  
}

// Variables for CloudFront

variable "origin_id" {
  type = string
  description = "Origin ID is a Unique Identifier for referring a origin"
  default = "s3-origin"
}

variable "origin_shield_value" {
  type = bool
  description = "Value of Origin Shield (True for Enabled, False for Disabled)"
  default = true
}

variable "origin_shield_region" {
  type = string
  description = "Region for Origin Shield"
  default = "us-east-1"
}

variable "aliases" {
  type        = list(string)
  description = "Custom domain aliases (e.g., www.example.com)"
  default     = []
}

variable "restriction_type" {
  type = string
  description = "Type of Restrictions for the availability of contents in regions"
  default = "blacklist"
}

variable "geo_restriction_locations" {
  description = "List of country codes to restrict/allow."
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS"
  default = null
}

variable "root_object" {
  type        = string
  description = "Default file that CloudFront serves when a user accesses the domain"
  default     = "index.html"
}

variable "price_class" {
  type = string
  description = "Price Class for the Edge Location"
}

variable "cloudfront_tags" {
  type        = map(string)
  description = "Tags to apply to CloudFront Distribution"
  default     = {}
}

# variables for log group

# variable "cloudwatch_loggroup_name" {
#   description = "Name of the CloudWatch Log Group"
#   type        = string
# }

# variable "cloudwatch_loggroup_retention_in_days" {
#   description = "Retention period for logs"
#   type        = number
#   default     = 30
# }

# variable "cloudwatch_tags" {
#   description = "Tags for the log group"
#   type        = map(string)
#   default     = {}
# }
//

# variables for WAF

variable "waf_name" {
  type        = string
  description = "The name of the Web ACL"
}

variable "waf_description" {
  type        = string
  description = "Description of the Web ACL"
}

variable "waf_scope" {
  type        = string
  description = "The scope of the Web ACL (CLOUDFRONT or REGIONAL)"
  default     = "CLOUDFRONT"
}

variable "waf_metric_name" {
  type        = string
  description = "CloudWatch metric name for the Web ACL"
}

variable "managed_rules" {
  description = "List of managed rules to include in the Web ACL"
  type = list(object({
    name            = string
    priority        = number
    rule_group_name = string
    vendor_name     = string
    metric_name     = string
    cloudwatch_metrics_enabled = bool
    sampled_requests_enabled = bool
  }))
}

variable "waf_tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

variable "waf_log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group for WAF logs"
}

variable "waf_log_retention_days" {
  type        = number
  description = "Retention days for CloudWatch logs"
  default     = 30
}

variable "waf_cloudwatch_metrics" {
  type = bool
  description = "WAF Cloudwatch Enable or Disable value"
  default = true
}

variable "waf_sampled_requests" {
  type = bool
  description = "WAF Sample Requested Enable or Disable value"
  default = true
}

variable "acm_status" {
  type = bool
  description = "Specifies whether ACM Certificate status is issued or not"
  default = false
}