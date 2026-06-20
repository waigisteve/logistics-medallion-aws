variable "name_prefix" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

resource "aws_s3_bucket" "raw" {
  bucket = "${var.name_prefix}-raw"
}

resource "aws_s3_bucket" "silver" {
  bucket = "${var.name_prefix}-silver"
}

resource "aws_s3_bucket" "gold" {
  bucket = "${var.name_prefix}-gold"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "raw" {
  bucket = aws_s3_bucket.raw.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

output "raw_bucket_arn" {
  value = aws_s3_bucket.raw.arn
}
