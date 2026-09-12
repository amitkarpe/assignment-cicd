terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

variable "run_id" {
  type = string
}

resource "aws_s3_bucket" "proof" {
  bucket = "chatgpt-gh-oidc-tf-proof-340510-${var.run_id}"

  tags = {
    project   = "chatgpt-aws"
    direction = "github-oidc-terraform"
    owner     = "amit"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.proof.bucket
}
