provider "aws" {
  profile    = "arc-demo"
  region     = "eu-west-1"
}

// Using S3 as a remote state backend does not support states per workspace

//terraform {
//  backend "s3" {
//    bucket = "terraform-remote-state-workspace-harry-test"
//    key    = "terraform/remotestate"
//    region = "eu-west-1"
//  }
//
//}

module "variables" {
  source = "github.com/stroeer/terraform-playground-variables"
}

resource "aws_instance" "instance_per_env" {
  ami           = "ami-064f92a2adac8cbb0"
  instance_type = "t2.nano"
    tags = merge(
      module.variables.default_tags,
      {
        Name = "Test-Resource-${module.variables.environment}"
      }  
  ) 
}