variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "object_ownership" {
  description = "Ownership of the project"
  type = string
}

variable "versioning_configuration" {
  description = "Boolean Value fot Bucket Versioning Configuration"
  type = bool
  default = true
}
