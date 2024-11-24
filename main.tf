# Terraform Configuration
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# S3 Bucket Resource
resource "aws_s3_bucket" "example" {
  bucket = "example-terraform-lint-test-bucket"
  acl    = "private"

  tags = {
    Name        = "ExampleB
