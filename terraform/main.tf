data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = [ "s3:GetObject" ]
    principals {
      type = "*"
      identifiers = [ "*" ]
    }
    resources = [ "arn:aws:s3:::sirisexplore01001011/*" ]
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "sirisexplore01001011"
  acl    = "public-read"
  policy =  data.aws_iam_policy_document.bucket_policy.json
  website {
    index_document = "index.htm"
    error_document = "error.htm"
  }
}

output "website_bucket_url" {
  value = aws_s3_bucket.website.website_endpoint
}
