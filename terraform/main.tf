module "security" {
  source                 = "./modules/security"
  name_prefix            = local.name_prefix
  kms_key_administrators = var.kms_key_administrators
}

module "streaming" {
  source      = "./modules/streaming"
  name_prefix = local.name_prefix
}

module "data_lake" {
  source      = "./modules/data_lake"
  name_prefix = local.name_prefix
  kms_key_arn = module.security.kms_key_arn
}

module "processing" {
  source         = "./modules/processing"
  name_prefix    = local.name_prefix
  raw_bucket_arn = module.data_lake.raw_bucket_arn
}

module "warehouse_integration" {
  source                = "./modules/warehouse_integration"
  name_prefix           = local.name_prefix
  snowflake_secret_name = var.snowflake_secret_name
}

module "observability" {
  source      = "./modules/observability"
  name_prefix = local.name_prefix
}
