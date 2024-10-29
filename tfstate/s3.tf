resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket        = var.s3_bucket_name
  tags          = var.tags
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
}
