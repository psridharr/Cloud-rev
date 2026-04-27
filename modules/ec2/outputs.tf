output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.this.public_ip
}

output "security_group_id" {
  description = "Security group ID for EC2"
  value       = aws_security_group.this.id
}
