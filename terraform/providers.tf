terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

  }

}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}