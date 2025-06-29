# Output the name of the created S3 bucket
output "bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

# Output the name of the created DynamoDB table
output "table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}
