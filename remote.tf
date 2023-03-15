terraform {
  backend "remote" {
    organization = "Carlo-Cloud"
    workspaces {
      name = "terraform-aws-transfer-family"
    }
  }
}