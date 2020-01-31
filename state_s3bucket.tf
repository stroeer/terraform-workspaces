//provider "aws" {
//  profile    = "arc-demo"
//  region     = "eu-west-1"
//}
//
//resource "aws_s3_bucket" "b" {
//  bucket = "terraform-remote-state-workspace-harry-test"
//  acl    = "private"
//
//  tags = {
//    Name        = "Terraform Workspace Remote State"
//    managed_by = "terraform",
//    team = "Buzz"
//  }
//}