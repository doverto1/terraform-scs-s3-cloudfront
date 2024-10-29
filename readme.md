# Terraform-SCS-S3-Cloudfront

1. Start in the tfstate folder.
```
cd tfstate
```
2. Rename terraform.tfvars.example to terraform.tfvars.
```
mv terraform.tfvars.example terraform.tfvars
```
3. Change the variables in terraform.tfvars.
4. Run terraform init.
```
terraform init
```
5. Run terraform apply.
```
terraform apply
```
6. Navigate to the top level directory.
```
cd ..
```
7. Rename the terraform.tvars.example file to terraform.tfvars.
```
mv terraform.tfvars.example terraform.tfvars
```
8. Change variables in terraform.tfvars.
9. Change the [state bucket name](https://github.com/doverto1/terraform-scs-s3-cloudfront/blob/5e713ae2c22ebd6113a6d8744d2f392a96bd427a/providers.tf#L11) 
10. Change the [state bucket name in key](https://github.com/doverto1/terraform-scs-s3-cloudfront/blob/5e713ae2c22ebd6113a6d8744d2f392a96bd427a/providers.tf#L12)
11. Change the [state dynamodb table name](https://github.com/doverto1/terraform-scs-s3-cloudfront/blob/5e713ae2c22ebd6113a6d8744d2f392a96bd427a/providers.tf#L15)
12. Terraform init
```
terraform init
```
13. Terraform apply
```
terraform apply
```
<img src="TFTemplate-Public-S3-Cloudfront-non-route53.png"/>
