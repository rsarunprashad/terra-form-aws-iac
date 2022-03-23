resource "aws_s3_bucket" "tf_arun_aws_s3_bucket" {
  bucket_prefix = "rsarun"
}


data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.tf_arun_aws_s3_bucket.arn,
      "${aws_s3_bucket.tf_arun_aws_s3_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.tf_arun_aws_s3_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}