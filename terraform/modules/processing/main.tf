variable "name_prefix" {
  type = string
}

variable "raw_bucket_arn" {
  type = string
}

resource "aws_glue_catalog_database" "platform" {
  name = replace("${var.name_prefix}_catalog", "-", "_")
}

resource "aws_cloudwatch_log_group" "processing" {
  name              = "/aws/${var.name_prefix}/processing"
  retention_in_days = 30
}

resource "terraform_data" "processing_blueprint" {
  input = {
    runtime        = "glue_streaming_or_flink"
    raw_bucket_arn = var.raw_bucket_arn
    silver_format  = "parquet_or_iceberg"
  }
}
