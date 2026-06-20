# AWS Terraform Scaffold

This scaffold is modular so the route can become an independent project with minimal restructuring.

## Modules

- `security`: KMS and IAM anchors
- `streaming`: Kinesis resources
- `data_lake`: bronze, silver, and gold S3 resources
- `processing`: Glue or Flink runtime scaffolding
- `warehouse_integration`: Snowflake connectivity placeholders
- `observability`: logs, metrics, and alerts

## Environments

- `envs/dev`
- `envs/test`
- `envs/prod`

Each environment is an entry point that calls the root module with environment-specific values.
