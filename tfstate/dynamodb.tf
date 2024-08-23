resource "aws_dynamodb_table" "wpccisaws_sandbox_terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  tags         = var.tags

  attribute {
    name = "LockID"
    type = "S"
  }
}
