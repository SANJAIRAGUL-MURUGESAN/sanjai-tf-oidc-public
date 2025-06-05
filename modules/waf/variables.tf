variable "waf_basic_config" {
  type = object({
    waf_name             = string
    waf_description      = string
    waf_scope            = string
    waf_metric_name      = string
    waf_tags             = map(string)
    waf_log_group_name   = string
    waf_log_retention_days = number
    waf_cloudwatch_metrics = bool
    waf_sampled_requests = bool
  })
  description = "Basic WAF Configuration"
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


# variable "waf_name" {
#   type        = string
#   description = "The name of the Web ACL"
# }

# variable "waf_description" {
#   type        = string
#   description = "Description of the Web ACL"
# }

# variable "waf_scope" {
#   type        = string
#   description = "The scope of the Web ACL (CLOUDFRONT or REGIONAL)"
#   default     = "CLOUDFRONT"
# }

# variable "waf_metric_name" {
#   type        = string
#   description = "CloudWatch metric name for the Web ACL"
# }

# variable "waf_tags" {
#   type        = map(string)
#   description = "Tags to apply to resources"
#   default     = {}
# }

# variable "waf_log_group_name" {
#   type        = string
#   description = "Name of the CloudWatch log group for WAF logs"
# }

# variable "waf_log_retention_days" {
#   type        = number
#   description = "Retention days for CloudWatch logs"
#   default     = 30
# }

# variable "waf_cloudwatch_metrics" {
#   type = bool
#   description = "WAF Cloudwatch Enable or Diable value"
#   default = true
# }

# variable "waf_sampled_requests" {
#   type = bool
#   description = "WAF Sample Requested Enable or Diable value"
#   default = true
# }