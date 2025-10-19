terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraformbackendmineria-cebaezc-terraform-state"
    key = ""
    region = "us-east-2"
    encrypt    = true
    kms_key_id = "c7229ec0-f3b7-4ee4-8279-1242fb8ff205"
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Topic = "terraform"
    }
  }
}