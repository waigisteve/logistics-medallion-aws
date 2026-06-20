locals {
  name_prefix = "${var.project_name}-${var.environment}"

  medallion_layers = ["bronze", "silver", "gold"]

  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    route       = "aws"
  }
}
