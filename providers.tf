terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare" 
      version = "~> 4"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
