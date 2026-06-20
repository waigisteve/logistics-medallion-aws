variable "name_prefix" {
  type = string
}

resource "aws_sns_topic" "alerts" {
  name = "${var.name_prefix}-alerts"
}

resource "aws_cloudwatch_log_group" "platform" {
  name              = "/aws/${var.name_prefix}/platform"
  retention_in_days = 30
}
