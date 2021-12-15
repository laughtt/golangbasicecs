provider "aws" {
  profile = terraform.workspace
  region  = "us-east-1"
  version = "~> 2.69.0"
}

terraform {
  backend "s3" {
    bucket         = "terraform-bucket-state-dev-startup"
    key            = "tf.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "remote-state-lock"
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
