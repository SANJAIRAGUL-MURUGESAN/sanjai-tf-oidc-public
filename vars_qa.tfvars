bucket_name = "sanjai-workspace-infra-qa"
object_ownership = "BucketOwnerEnforced"
versioning_configuration = "Enabled"
oac_name = "sanjai-oac"
root_object = "index.html"
price_class = "PriceClass_100"
acm_certificate_arn = "arn:aws:acm:us-east-1:853973692277:certificate/37900818-378e-4ad7-bd8c-a5da29fea083"
origin_id = "sanjai-s3-frontend-origin"
origin_shield_region = "us-east-1"
origin_shield_value = true
restriction_type = "blacklist"
geo_restriction_locations =  ["CN"]
aliases = [ "sanjairagulm.com" ]
s3_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}
cloudfront_tags = {
  Environment = "qa"
  Owner       = "TDKSensEI"
  Project     = "frontend-dashboard"
}


