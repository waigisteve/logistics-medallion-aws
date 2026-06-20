# AWS Implementation Plan

## Workflow

1. Publish events into `Kinesis Data Streams`.
2. Land immutable raw data in S3 bronze.
3. Validate and enrich through Glue Streaming or Flink.
4. Write silver Parquet or Iceberg objects.
5. Load Snowflake staging and incremental marts.
6. Expose gold tables to operations, finance, and DS consumers.

## Why AWS

- Strong fit for teams already standardized on `S3`, `IAM`, and `Kinesis`.
- Lake Formation and Glue Schema Registry are strong guardrails for governance-heavy environments.

## Cost Strategy

- Prefer Kinesis mode selection based on predictable vs bursty traffic.
- Keep bronze retention cheap with lifecycle rules.
- Compact silver data and isolate Snowflake warehouses.
- Avoid nightly full history scans.

## CI/CD

- Pull request: `terraform fmt -check`, `terraform validate`
- Main branch: `plan` for `dev`
- Protected environments: manual `apply` for `test` and `prod`
