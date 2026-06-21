# AWS Architecture Workflow

<table>
  <tr>
    <td align="center"><img src="assets/icons/amazon-kinesis-data-streams.svg" width="56" alt="Amazon Kinesis Data Streams"><br><strong>Kinesis Data Streams</strong><br>Ingestion bus</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/amazon-s3-standard.svg" width="56" alt="Amazon S3"><br><strong>Amazon S3</strong><br>Bronze raw landing</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/aws-glue.svg" width="56" alt="AWS Glue"><br><strong>AWS Glue Streaming</strong><br>Validation and canonicalization</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/amazon-s3-standard.svg" width="56" alt="Amazon S3"><br><strong>S3 Silver/Gold</strong><br>Parquet or Iceberg curated lake</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/snowflake.svg" width="56" alt="Snowflake"><br><strong>Snowflake</strong><br>Serving marts and reconciliation</td>
  </tr>
</table>

## Control Overlay

<table>
  <tr>
    <td align="center"><img src="assets/icons/aws-cloud.svg" width="44" alt="AWS Cloud"><br><strong>AWS Identity Plane</strong><br>Access control</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/amazon-cloudwatch.svg" width="44" alt="CloudWatch"><br><strong>CloudWatch</strong><br>Freshness, replay, anomaly, and intrusion alerts</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/amazon-s3-standard.svg" width="44" alt="Amazon S3"><br><strong>S3 Versioning/Object Lock</strong><br>Delete protection and restore point</td>
  </tr>
</table>
