provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source                   = "./modules/s3"
  bucket_name              = var.bucket_name
  object_ownership         = var.object_ownership
  versioning_configuration = var.versioning_configuration
  s3_tags = var.s3_tags
}

module "oac" {
  source = "./modules/oac"
  oac_name = var.oac_name
}

module "cloudfront" {
  source                    = "./modules/cloudfront"
  s3_domain_name            = module.s3.bucket_domain_name
  origin_access_control_id  = module.oac.id
  root_object               = var.root_object
  price_class               = var.price_class
  acm_certificate_arn       = var.acm_certificate_arn
  origin_id                 = var.origin_id
  origin_shield_region      = var.origin_shield_region
  origin_shield_value       = var.origin_shield_value
  restriction_type          = var.restriction_type
  aliases = var.aliases
  geo_restriction_locations = var.geo_restriction_locations
  cloudfront_tags = var.cloudfront_tags
}

module "s3_bucket_policy" {
  source                    = "./modules/s3_bucket_policy"
  bucket_id                 = module.s3.bucket_id
  bucket_arn                = module.s3.bucket_arn
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}