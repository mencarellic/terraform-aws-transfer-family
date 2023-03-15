resource "aws_s3_bucket" "transfer_bucket" {
  bucket = "${local.account_id}-transfer-bucket"
  acl    = "private"
}
