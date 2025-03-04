provider "aws" {
  region = "us-west-2"  # Adjust to your preferred region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-123-noushad" # Replace with a globally unique name
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"  # Subnet within VPC CIDR
  availability_zone = "us-west-2a"   # Adjust AZ as needed
  map_public_ip_on_launch = true     # Makes it public by assigning public IPs

  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"  # Different subnet within VPC CIDR
  availability_zone = "us-west-2a"   # Same or different AZ

  tags = {
    Name = "private-subnet"
  }
}
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-noushad2"  # Replace with your state bucket name
    key            = "terraform.tfstate"
    region         = "us-west-2"                  # Match your region
    dynamodb_table = "terraform-locks"            # Replace with your DynamoDB table name
  }
}

