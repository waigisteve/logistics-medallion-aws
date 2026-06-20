variable "name_prefix" {
  type = string
}

variable "snowflake_secret_name" {
  type = string
}

resource "aws_secretsmanager_secret" "snowflake" {
  name = "${var.snowflake_secret_name}/${var.name_prefix}"
}
