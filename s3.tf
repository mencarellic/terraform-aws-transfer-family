resource "aws_s3_bucket" "transfer_bucket" {
  bucket = "${local.account_id}-transfer-bucket"
}

resource "aws_s3_bucket_acl" "transfer_bucket_bucket_acl" {
  bucket = aws_s3_bucket.transfer_bucket.id
  acl    = "private"
}