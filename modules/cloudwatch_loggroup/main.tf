resource "aws_cloudwatch_log_group" "this" {
  name              = var.cloudwatch_loggroup_name
  retention_in_days = var.cloudwatch_loggroup_retention_in_days
  tags              = var.cloudwatch_tags
}