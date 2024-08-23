Creates a Cloudfront distribution for a given S3 bucket and Route 53 name


## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| locations | Cloudfront locations | list | yes
| s3_bucket_name | Name of the S3 Bucket | string | yes |
| tags | Standard Tags| `map(string)` | yes |
## Outputs

None.

<img src="TFTemplate-Public-S3-Cloudfront-non-route53.png"/>