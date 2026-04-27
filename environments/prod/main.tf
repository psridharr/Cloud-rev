provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Environment = "prod"
    Project     = var.project_name
    Owner       = var.owner
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name            = "${var.project_name}-prod-vpc"
  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs
  tags            = local.common_tags
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name                   = "${var.project_name}-prod-app"
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  key_name               = var.key_name
  tags                   = local.common_tags
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"

  bucket = "${var.project_name}-prod-app-artifacts-001"
  versioning = {
    enabled = true
  }
  tags = local.common_tags
}
