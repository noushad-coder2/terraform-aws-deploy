provider "aws" {
  region = "us-west-2"  # Adjust to your preferred region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123-noushad" # Replace with a globally unique name
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-noushad2"  # Replace with your state bucket name
    key            = "terraform.tfstate"
    region         = "us-west-2"                  # Match your region
    dynamodb_table = "terraform-locks"            # Replace with your DynamoDB table name
  }
}

