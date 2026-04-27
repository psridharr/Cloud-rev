# Terraform Multi-Environment Infrastructure (Sample infra )

This repository is a small but realistic Terraform setup modeled after a company workflow:

- Reusable infrastructure modules in `modules/`
- Environment-specific stacks in `environments/`
- Separate configuration for `dev`, `staging`, and `prod`

## Structure

- `modules/vpc` - VPC, public/private subnets, and route tables
- `modules/ec2` - EC2 instance and security group
- `modules/s3` - S3 bucket with basic security settings
- `environments/<env>` - Environment stack wiring modules together

## Notes on Versions

This project intentionally uses **older, stable patterns**:

- Terraform `~> 1.3.0`
- AWS Provider `~> 4.67`

## Typical Workflow

From an environment folder (example: `environments/dev`):

1. `terraform init`
2. `terraform fmt -recursive`
3. `terraform validate`
4. `terraform plan -var-file="terraform.tfvars"`
5. `terraform apply -var-file="terraform.tfvars"`

## Important

- Replace placeholder IDs (like AZs and AMI IDs) with values valid for your AWS account/region.
- For real production usage, configure remote backend state and locking (S3 + DynamoDB).
