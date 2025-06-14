// Values for AWS Certificate Manager
acm_region = "us-east-1"
primary_domain = "tdkdashboard.com"
alternative_domains = []
acm_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}


// Values for S3 Bucket
bucket_name = "sanjai-workspace-infra-qa"
object_ownership = "BucketOwnerEnforced"
versioning_configuration = "Enabled"
s3_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}

// Values for OAC
oac_name = "sanjai-oac"


// Values for CloudFront
root_object = "index.html"
price_class = "PriceClass_100"
# acm_certificate_arn = "arn:aws:acm:us-east-1:853973692277:certificate/3a3455bf-06f4-404d-9ce7-f4ea70065c3a"
origin_id = "sanjai-s3-frontend-origin"
origin_shield_region = "us-east-1"
origin_shield_value = true
restriction_type = "blacklist"
geo_restriction_locations =  ["CN"]
aliases = ["tdkdashboard.com"]
cloudfront_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}
acm_status = true

// Values for Cloudwatch Log group(for waf)

# cloudwatch_loggroup_name = "sanjai-cloudwatch-log-group"
# cloudwatch_loggroup_retention_in_days = 30
# cloudwatch_tags = {
#   Environment = "qa"
#   Owner       = "TDKSensEI"
#   Project     = "frontend-dashboard"
# }

// Values for WAF
waf_name = "sanjai-waf"
waf_description = "waf for sanjai cloudfront distribution"
waf_scope  = "CLOUDFRONT"
waf_metric_name = "sanjai-waf-metric"
waf_cloudwatch_metrics = true
waf_sampled_requests = true
waf_log_group_name = "aws-waf-logs-sanjai-log-group"
waf_log_retention_days = 30
waf_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}
managed_rules = [
    {
      name            = "AWS-AWSManagedRulesCommonRuleSet"
      priority        = 0
      rule_group_name = "AWSManagedRulesCommonRuleSet"
      vendor_name     = "AWS"
      metric_name     = "AWSManagedRulesCommonRuleSet"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled = true
    },
    {
      name            = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      priority        = 1
      rule_group_name = "AWSManagedRulesKnownBadInputsRuleSet"
      vendor_name     = "AWS"
      metric_name     = "AWSManagedRulesKnownBadInputsRuleSet"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled = true
    },
    {
      name            = "AWSManagedRulesSQLiRuleSet"
      priority        = 2
      rule_group_name = "AWSManagedRulesSQLiRuleSet"
      vendor_name     = "AWS"
      metric_name     = "AWSManagedRulesSQLiRuleSet"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled = true
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList"
      priority        = 3
      rule_group_name = "AWSManagedRulesAmazonIpReputationList"
      vendor_name     = "AWS"
      metric_name     = "AWSManagedRulesAmazonIpReputationList"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled = true
    },
    {
      name            = "AWSManagedRulesBotControlRuleSet"
      priority        = 4
      rule_group_name = "AWSManagedRulesBotControlRuleSet"
      vendor_name     = "AWS"
      metric_name     = "AWSManagedRulesBotControlRuleSet"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled = true
    }
  ]

waf_basic_config = {
  waf_name                          = "waf"
  waf_scope                         = "CLOUDFRONT"
  waf_metric_name                   = "waf-metric"
  waf_cloudwatch_metrics            = false
  waf_sampled_requests              = false
  waf_log_group_name                = "waf-log-group"
  waf_log_retention_days            = 30
  waf_tags                          = {}
  aws_region                        = "us-east-1"
  waf_access_cloudwatch_policy_name = "waf-cloudwatch-access-policy"
}

//