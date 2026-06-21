# AWS Route

This route implements the scenario with:

- `Amazon Kinesis Data Streams`
- `Amazon S3`
- `AWS Glue Streaming` or `Managed Service for Apache Flink`
- `Snowflake`

## Repository Navigation

- `docs/implementation_plan.md`
- `docs/tooling_and_workflow.md`
- `docs/deployment_sequence.md`
- `docs/cost_model.md`
- `docs/architecture_workflow.md`
- `docs/integrity_security_controls.md`
- `terraform/README.md`

## Route Intent

This route is for teams that want the medallion pattern to stay fully AWS-native until curated outputs are handed to a serving warehouse.

It is designed for:

- `<5 minute` shipment-status freshness
- `<10 second` dashboard reads through curated gold outputs loaded into `Snowflake`
- Strong schema control through `Glue Schema Registry` and `Lake Formation`
- Measured storage and compute cost through compaction, lifecycle management, and isolated warehouse workloads

## Defined Tools

| Stage | Primary Tool | Role |
|---|---|---|
| Ingestion | `Amazon Kinesis Data Streams` | Accept vehicle, shipment, and hub events with replayable retention |
| Bronze/Silver/Gold object storage | `Amazon S3` | Store medallion layers with lifecycle and partition control |
| Schema control | `Glue Schema Registry` | Enforce producer contracts and event versioning |
| Stream processing | `AWS Glue Streaming` or `Managed Service for Apache Flink` | Validate, deduplicate, enrich, watermark, and quarantine |
| Governance | `Lake Formation` | Permission boundaries and governed access to curated data |
| Serving warehouse | `Snowflake` | Gold marts, BI-facing serving tables, and downstream data science extracts |
| Observability | `CloudWatch` and `SNS` | Freshness, lag, and failure alerting |

## Medallion Layout

- Bronze: raw S3 landing bucket prefixes
- Silver: curated Parquet or Iceberg prefixes
- Gold: aggregate and mart prefixes for fast downstream loading

## Scaffold Contents

- `docs/implementation_plan.md`: route workflow and implementation plan
- `docs/tooling_and_workflow.md`: tool definitions and stage ownership
- `docs/deployment_sequence.md`: rollout sequence for `dev`, `test`, and `prod`
- `docs/cost_model.md`: primary cost levers and risk areas
- `terraform/`: modular scaffold with environment entry points
- `.github/workflows/terraform.yml`: CI validation skeleton

## Terraform Structure

- `terraform/security`: KMS and baseline IAM placeholders
- `terraform/streaming`: Kinesis stream
- `terraform/data_lake`: bronze, silver, and gold buckets
- `terraform/processing`: Glue catalog and processing placeholders
- `terraform/warehouse_integration`: Snowflake secret placeholder
- `terraform/observability`: CloudWatch and SNS

## Environments

- `terraform/envs/dev`
- `terraform/envs/test`
- `terraform/envs/prod`
