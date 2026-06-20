# AWS Cost Model

## Primary Cost Drivers

- `Kinesis`: shard or on-demand throughput sizing
- `S3`: raw retention, silver compaction frequency, and request volume
- `Glue Streaming` or `Flink`: continuous processing runtime
- `Snowflake`: warehouse concurrency and full-scan risk
- `CloudWatch`: high-cardinality logs and long retention

## Main Levers

- Match Kinesis mode to real burst patterns.
- Expire bronze aggressively after replay requirements are met.
- Compact curated files to reduce repeated downstream scans.
- Keep Snowflake loads incremental and isolate heavy consumers.

## Risk Areas

- Over-sharded streams during steady periods
- Small-file buildup in silver and gold
- Nightly full-history warehouse reloads
