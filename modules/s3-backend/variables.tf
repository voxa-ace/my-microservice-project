# S3 bucket name to create
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# DynamoDB table name to create
variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}
