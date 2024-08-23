terraform {
  required_providers {
    aws = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
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


