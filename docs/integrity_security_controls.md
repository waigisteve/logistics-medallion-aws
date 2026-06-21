# AWS Integrity And Security Controls

## Data Deletion

- `Kinesis` retention preserves replay after downstream loss.
- `S3` versioning and object-lock style controls protect bronze and curated datasets.
- `Snowflake` gold marts are rebuildable from curated lake outputs instead of being treated as the system of record.

## Data Duplication

- Duplicate events are retained in bronze but suppressed before silver.
- `Glue Streaming` or `Flink` should use deterministic `event_id` or `event_key` plus watermarking.
- `Snowflake MERGE` keeps facts and marts idempotent.

## Security Infiltration

- Separate publisher, processor, loader, and admin identities.
- Use least-privilege IAM, encrypted storage, and private connectivity where supported.
- `CloudWatch` and audit telemetry should alert on unexpected access, freshness anomalies, and tampering indicators.

## Integrity Outcome

The route stays recoverable because raw truth remains replayable, curated writes stay idempotent, and serving can be rebuilt from trusted upstream layers.
