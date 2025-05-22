locals {
  oac_name = "${var.oac_name}-${terraform.workspace}"
}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = local.oac_name
  description                       = "Name of the OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
