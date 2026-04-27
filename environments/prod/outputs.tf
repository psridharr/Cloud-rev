output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.ec2.id
}

output "bucket_arn" {
  value = module.s3.s3_bucket_arn
}
