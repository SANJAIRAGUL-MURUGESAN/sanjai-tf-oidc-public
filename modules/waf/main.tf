provider "aws" {
  alias = "us_east_1"
  region = "us-east-1"
}

resource "aws_wafv2_web_acl" "this" {
  name        = var.waf_basic_config.waf_name
  description = var.waf_basic_config.waf_description
  scope       = var.waf_basic_config.waf_scope

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.waf_basic_config.waf_cloudwatch_metrics
    metric_name                = var.waf_basic_config.waf_metric_name
    sampled_requests_enabled   = var.waf_basic_config.sampled_requests_enabled
  }

  dynamic "rule" {
    for_each = var.managed_rules != null ? [var.managed_rules] : null
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

  tags = var.waf_basic_config.waf_tags
}

resource "aws_cloudwatch_log_group" "waf_logs" {
  provider          = aws.us_east_1
  name              = var.waf_basic_config.waf_log_group_name
  retention_in_days = var.waf_basic_config.waf_log_retention_days
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "waf_logging" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups"
    ]

    resources = [
      "${aws_cloudwatch_log_group.waf_logs.arn}:*"
    ]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [
        "arn:aws:wafv2:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:global/webacl/*"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [
        data.aws_caller_identity.current.account_id
      ]
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "waf_logging" {
  policy_name     = "aws-waf-logs-sanjai-log-group"
  policy_document = data.aws_iam_policy_document.waf_logging.json
}

resource "aws_wafv2_web_acl_logging_configuration" "this" {
  # log_destination_configs = [aws_cloudwatch_log_group.waf_logs.arn]
  log_destination_configs = ["arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.waf_logs.name}"]
  resource_arn            = aws_wafv2_web_acl.this.arn

  depends_on = [aws_cloudwatch_log_resource_policy.waf_logging]
}

////