variable "s3_domain_name" {
  type = string
  description = "Name of the S3 Domain"
}

variable "origin_access_control_id" {
  type = string
  description = "ID of the Origin Access Control Created"
}

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
