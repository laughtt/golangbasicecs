provider "aws" {
  profile = terraform.workspace
  region  = var.region
  version = "~> 2.70.0"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


terraform {
  backend "s3" {
    bucket         = "terraform-backend-state-dond"
    key            = "main-app-golang.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "terraform-state-locking-table"
  }
}

data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-state-dond"
    key    = "env:/dev/main.tfstate"
    region = "us-east-1"
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Ambiente     = terraform.workspace
    Proyecto     = var.prefix
    Lider        = var.contact
    Administrado = "Terraform"
  }
}
