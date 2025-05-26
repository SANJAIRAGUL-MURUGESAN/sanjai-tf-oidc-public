// Values for AWS Certificate Manager
acm_region = "us-east-1"
primary_domain = "tdkdashboard.com"
alternative_domains = ["dev.tdkdashboard.com"]
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
acm_certificate_arn = "arn:aws:acm:us-east-1:853973692277:certificate/37900818-378e-4ad7-bd8c-a5da29fea083"
origin_id = "sanjai-s3-frontend-origin"
origin_shield_region = "us-east-1"
origin_shield_value = true
restriction_type = "blacklist"
geo_restriction_locations =  ["CN"]
aliases = [ "tdkdashboard.com","dev.tdkdashboard.com" ]
cloudfront_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}






