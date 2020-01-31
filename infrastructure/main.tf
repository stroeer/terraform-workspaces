provider "aws" {
  profile    = "arc-demo"
  region     = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-state-workspace-harry-test"
    key    = "terraform/remotestate"
    region = "eu-west-1"
  }

}

module "variables" {
  source = "../../terraform-playground-variables"
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