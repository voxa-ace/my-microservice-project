# Create a new S3 bucket for storing the Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name

  tags = {
    Name = "Terraform State Bucket"
  }

  lifecycle {
    prevent_destroy       = false
    create_before_destroy = true
  }
}

# Enable versioning on the Terraform state bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
