variable "locations" {
  description = "Whitelisted CF locations"
  type        = list(any)
}

variable "s3_bucket_name" {
  description = "Name of the Public S3 Bucket"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "ASU Tags"
}
