provider "aws" {
  profile    = "arc-demo"
  region     = "eu-west-1"
}


terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "stroeer"

    workspaces {
      prefix = "ton-"
    }
  }
}

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