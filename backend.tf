# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-volodymyr-2906"
#     key            = "lesson-5/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks-2906"
#     encrypt        = true
#   }
# }
