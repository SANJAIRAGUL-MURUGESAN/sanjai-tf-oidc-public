resource "aws_wafv2_web_acl" "this" {
  name        = var.waf_name
  description = var.waf_description
  scope       = var.waf_scope

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics
    metric_name                = var.waf_metric_name
    sampled_requests_enabled   = var.waf_sampled_requests
  }

  dynamic "rule" {
    for_each = var.managed_rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      override_action {
        none {}
      }

      statement {
        managed_rule_group_statement {
          name        = rule.value.rule_group_name
          vendor_name = rule.value.vendor_name
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = rule.value.cloudwatch_metrics_enabled
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = rule.value.sampled_requests_enabled
      }
    }
  }

  tags = var.waf_tags
}

resource "aws_cloudwatch_log_group" "waf_logs" {
  name              = var.waf_log_group_name
  retention_in_days = var.waf_log_retention_days
}

resource "aws_wafv2_web_acl_logging_configuration" "this" {
  log_destination_configs = ["${aws_cloudwatch_log_group.waf_logs.arn}:*"]
  resource_arn            = aws_wafv2_web_acl.this.arn
}
