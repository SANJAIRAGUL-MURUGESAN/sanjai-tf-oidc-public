provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_1"
  region = var.acm_region  # Only for ACM to be used with CloudFront
}

module "acm_cert" {
  source            = "./modules/acm_certificate"
  primary_domain    = var.primary_domain
  alternative_domains = var.alternative_domains
  acm_tags = var.acm_tags

  providers = {
    aws = aws.us_east_1
  }
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
  acm_certificate_arn       = var.acm_status ? module.acm_cert.certificate_arn : null
  origin_id                 = var.origin_id
  origin_shield_region      = var.origin_shield_region
  origin_shield_value       = var.origin_shield_value
  restriction_type          = var.restriction_type
  aliases = var.aliases
  geo_restriction_locations = var.geo_restriction_locations
  cloudfront_tags = var.cloudfront_tags
  waf_arn = module.waf.waf_acl_arn
}

module "s3_bucket_policy" {
  source                    = "./modules/s3_bucket_policy"
  bucket_id                 = module.s3.bucket_id
  bucket_arn                = module.s3.bucket_arn
  cloudfront_distribution_arn = module.cloudfront.cloudfront_distribution_arn
}

# module "waf_log_group" {
#   source            = "./modules/cloudwatch_loggroup"
#   cloudwatch_loggroup_name =  var.cloudwatch_loggroup_name
#   cloudwatch_loggroup_retention_in_days = var.cloudwatch_loggroup_retention_in_days
#   cloudwatch_tags = var.cloudwatch_tags
# }

module "waf" {
  source = "./modules/waf"
  waf_basic_config = {
    waf_name             = var.waf_basic_config.waf_name
    waf_description      = var.waf_basic_config.waf_description
    waf_scope            = var.waf_basic_config.waf_scope
    waf_metric_name      = var.waf_basic_config.waf_metric_name
    waf_tags             = var.waf_basic_config.waf_tags
    waf_log_group_name   = var.waf_basic_config.waf_log_group_name
    waf_log_retention_days = var.waf_basic_config.waf_log_retention_days
    waf_cloudwatch_metrics = var.waf_basic_config.waf_cloudwatch_metrics
    waf_sampled_requests = var.waf_basic_config.waf_sampled_requests
    # acm_status = var.waf_basic_config.acm_status
  }
  managed_rules = var.managed_rules
}

