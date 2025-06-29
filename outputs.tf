output "s3_backend_bucket" {
  description = "Name of the S3 bucket used for backend"
  value       = module.s3_backend.bucket_name
}

output "dynamodb_table" {
  description = "Name of the DynamoDB table used for state locking"
  value       = module.s3_backend.table_name
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

output "ecr_url" {
  description = "URL of the ECR repository"
  value       = module.ecr.repository_url
}
