# AWS Tooling And Workflow

| Stage | Primary Tool | Input | Output | Main Concern |
|---|---|---|---|---|
| Ingestion | `Amazon Kinesis Data Streams` | Logistics event producers | Ordered event shards | Throughput mode, lag, replay window |
| Raw landing | `Amazon S3` | Immutable event payloads | Bronze objects | Lifecycle, retention, partitioning |
| Schema control | `Glue Schema Registry` | Producer contracts | Versioned schemas | Drift detection, compatibility |
| Stream processing | `AWS Glue Streaming` or `Managed Service for Apache Flink` | Bronze event stream | Silver curated records and quarantine outputs | Stateful deduplication, watermarking |
| Curated storage | `Amazon S3` + `Parquet/Iceberg` | Validated records | Silver and gold datasets | Compaction, partition pruning |
| Serving warehouse | `Snowflake` | Gold lake outputs | BI marts and finance datasets | Warehouse sizing, incremental loads |
| Governance | `Lake Formation` | S3 and catalog metadata | Controlled data access | Fine-grained permissions |
| Observability | `CloudWatch` and `SNS` | Platform metrics and logs | Alerts and dashboards | Freshness, failures, cost spikes |

## Default Flow

`Kinesis -> S3 bronze -> Glue/Flink -> S3 silver/gold -> Snowflake`

## Notes

- `Snowflake` remains the default serving warehouse in this route.
- `Iceberg` is preferred when curated tables need open-table semantics and controlled evolution.
