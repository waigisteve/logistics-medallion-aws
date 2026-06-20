variable "name_prefix" {
  type = string
}

resource "aws_kinesis_stream" "events" {
  name             = "${var.name_prefix}-events"
  retention_period = 24
  shard_count      = 4
}

output "stream_name" {
  value = aws_kinesis_stream.events.name
}
