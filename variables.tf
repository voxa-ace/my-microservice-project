# S3 bucket name for backend
variable "bucket_name" {
  description = "Name of the S3 bucket to store Terraform state"
  type        = string
}

# DynamoDB table name for state locking
variable "table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}
