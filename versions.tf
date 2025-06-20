terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">= 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "newrelic" {
  account_id = var.newrelic_account_id
  region     = var.newrelic_account_region
  api_key    = var.newrelic_api_key
}
