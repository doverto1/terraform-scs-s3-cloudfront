variable "dynamodb_table_name" {
  description = "The name of the tfstate dynamodb_table"
}
variable "s3_bucket_name" {
  description = "Name of the tfstate S3 Bucket"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "ASU Tags"
}
