provider "aws" {
  region = "us-east-1"  # Adjust to your preferred region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123"  # Replace with a globally unique name
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Replace with your state bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1"                  # Match your region
    dynamodb_table = "terraform-locks"            # Replace with your DynamoDB table name
  }
}

