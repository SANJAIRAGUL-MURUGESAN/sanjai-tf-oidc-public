locals {
  domain_name = "${var.s3_domain_name}-${terraform.workspace}"
}

resource "aws_cloudfront_distribution" "this" {
  comment = "Sanjai CloudFront Distribution for ${terraform.workspace} environment"

  tags = var.cloudfront_tags 

  origin {
    domain_name              = var.s3_domain_name
    origin_id                = var.origin_id
    origin_access_control_id = var.origin_access_control_id
    
    origin_shield {   // Origin shield is an additional caching layer that can help reduce the load on your origin and help protect its availability
      enabled              = var.origin_shield_value
      origin_shield_region = var.origin_shield_region 
    }
  }
  
  aliases = var.aliases

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.geo_restriction_locations
    }
  }

  default_cache_behavior {
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"] // CloudFront accepts all these HTTP methods from users and forwards them to origin.
    cached_methods         = ["GET", "HEAD"]                                              // CloudFront caches responses only for GET and HEAD requests since they are static.
    compress               = true
    min_ttl     = 0
    default_ttl = 3600     # 3600 seconds = 1 hour
    max_ttl     = 3600
  }

  enabled             = true
  default_root_object = var.root_object 
  price_class         = var.price_class

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }
}
