variable "cloudwatch_loggroup_name" {
  description = "Name of the CloudWatch Log Group"
  type        = string
}

variable "cloudwatch_loggroup_retention_in_days" {
  description = "Retention period for logs"
  type        = number
  default     = 30
}

variable "cloudwatch_tags" {
  description = "Tags for the log group"
  type        = map(string)
  default     = {}
}
