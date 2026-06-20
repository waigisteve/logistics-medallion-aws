variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "kms_key_administrators" {
  type    = list(string)
  default = []
}

variable "snowflake_secret_name" {
  type    = string
  default = "snowflake/logistics"
}
