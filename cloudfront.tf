locals {
  s3_origin_id = "${var.s3_bucket_name}S3Origin"
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = var.s3_bucket_name
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.oai.id}"
    }
  }

  tags            = var.tags
  enabled         = true
  is_ipv6_enabled = true
  comment         = var.s3_bucket_name

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  depends_on = [
    aws_s3_bucket.bucket,
    local.s3_origin_id,
    aws_cloudfront_origin_access_identity.oai
  ]
}

data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
  depends_on = [
    aws_s3_bucket.bucket,
    aws_cloudfront_origin_access_identity.oai
  ]
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_policy_document.json
  depends_on = [
    aws_s3_bucket.bucket,
    data.aws_iam_policy_document.s3_policy_document
  ]
}
