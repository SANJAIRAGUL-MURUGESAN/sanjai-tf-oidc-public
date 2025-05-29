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

variable "aws" {
  type = string
  description = "Provider for AWS Certificate Manager to issue a certificate"
  default = "us-east-1"
}

