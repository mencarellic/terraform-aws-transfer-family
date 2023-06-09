resource "aws_transfer_server" "sftp_server" {
  identity_provider_type = "SERVICE_MANAGED"
  logging_role           = aws_iam_role.transfer_role.arn
  protocols              = ["SFTP"]
  security_policy_name   = "TransferSecurityPolicy-2022-03"

}

resource "aws_transfer_user" "sftp_user" {
  server_id = aws_transfer_server.sftp_server.id
  user_name = "example-user"
  role      = aws_iam_role.transfer_role.arn

  home_directory_type = "LOGICAL"

  home_directory_mappings {
    entry  = "/"
    target = "/${aws_s3_bucket.transfer_bucket.id}/$${Transfer:UserName}"
  }
}
