terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# NOTE:
# - Terraform enforces `version` only for Registry or Git-based module sources.
# - For local module sources, `version` is kept for enterprise structure
#   consistency and future migration to Registry/Git modules.
locals {
  common_tags = {
    Environment = "dev"
    Project     = var.project_name
    Owner       = var.owner
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source  = "app.terraform.io/company-name/vpc/aws"
  version = "1.0.0"

  name_prefix          = "${var.project_name}-dev"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  tags                 = local.common_tags
}

module "ec2" {
  source  = "app.terraform.io/company-name/ec2/aws"
  version = "1.0.0"

  name_prefix        = "${var.project_name}-dev"
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.vpc.public_subnet_ids[0]
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  allowed_ssh_cidrs  = var.allowed_ssh_cidrs
  allowed_http_cidrs = var.allowed_http_cidrs
  tags               = local.common_tags
}

module "s3" {
  source  = "app.terraform.io/company-name/s3/aws"
  version = "1.0.0"

  bucket_name        = "${var.project_name}-dev-app-artifacts-001"
  versioning_enabled = false
  tags               = local.common_tags
}
