resource "aws_s3_bucket" "wpccisaws_sandbox_terraform_state" {
  bucket        = var.s3_bucket_name
  tags          = var.tags
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }


}
