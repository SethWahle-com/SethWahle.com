terraform {
  required_providers {
    namecheap = {
      source = "namecheap/namecheap"
      version = "~> 2.0"
    }
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

provider "namecheap" {
  user_name = var.namecheap_user_name
  api_user = var.namecheap_api_user
  api_key = var.namecheap_api_key
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
