output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}
