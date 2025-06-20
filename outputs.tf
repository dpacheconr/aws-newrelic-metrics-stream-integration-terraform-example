output "newrelic_role_arn" {
  description = "ARN of the New Relic integration IAM role."
  value       = aws_iam_role.newrelic_aws_role.arn
}

output "firehose_stream_name" {
  description = "Name of the Kinesis Firehose delivery stream."
  value       = aws_kinesis_firehose_delivery_stream.newrelic_firehose_stream.name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket used for backup."
  value       = aws_s3_bucket.newrelic_aws_bucket.bucket
}

output "metric_stream_name" {
  description = "Name of the CloudWatch metric stream."
  value       = aws_cloudwatch_metric_stream.newrelic_metric_stream.name
}
