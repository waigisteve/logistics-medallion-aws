# AWS Deployment Sequence

## Dev

1. Provision Kinesis, S3, IAM, and observability scaffolding.
2. Connect one non-production producer stream.
3. Validate bronze writes, schema checks, and processing checkpoints.

## Test

1. Promote Terraform after review.
2. Replay representative production-like traffic.
3. Validate silver/gold correctness, Snowflake loads, and alerting.

## Prod

1. Apply protected Terraform changes.
2. Cut over producers in controlled batches.
3. Monitor lag, freshness, cost, and downstream warehouse load behavior.

## Promotion Rules

- `dev` is the proving ground for schema and pipeline changes.
- `test` must exercise replay, failure, and backfill behavior before production.
- `prod` promotion should remain approval-gated.
