terraform {
  required_version = ">= 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "<state_bucket_name>"
    key            = "global/cf/<s3_bucket_name>/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "<state_dynamodb_name>"
  }
}
