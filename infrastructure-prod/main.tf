provider "aws" {
  profile = terraform.workspace
  region  = var.region
  version = "~> 2.70.0"
}

terraform {
  backend "s3" {
    bucket         = "terraform-backend-state-dond"
    key            = "main.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "terraform-state-locking-table"
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Ambiente     = terraform.workspace
    Proyecto     = var.project
    Lider        = var.contact
    Administrado = "Terraform"
  }
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}