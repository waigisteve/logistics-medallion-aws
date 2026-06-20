module "platform" {
  source = "../../"

  environment           = "prod"
  aws_region            = var.aws_region
  project_name          = var.project_name
  snowflake_secret_name = var.snowflake_secret_name
}

variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "aws_region" {
  type = string
}

variable "snowflake_secret_name" {
  type = string
}
