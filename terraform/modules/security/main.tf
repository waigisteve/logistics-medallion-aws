variable "name_prefix" {
  type = string
}

variable "kms_key_administrators" {
  type = list(string)
}

resource "aws_kms_key" "platform" {
  description             = "KMS key for ${var.name_prefix} data platform"
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "platform" {
  name          = "alias/${var.name_prefix}"
  target_key_id = aws_kms_key.platform.key_id
}

output "kms_key_arn" {
  value = aws_kms_key.platform.arn
}
