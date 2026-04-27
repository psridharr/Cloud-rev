variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EC2 is deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "Allowed CIDRs for SSH"
  type        = list(string)
}

variable "allowed_http_cidrs" {
  description = "Allowed CIDRs for HTTP"
  type        = list(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "security_group_name_suffix" {
  description = "Suffix appended to name_prefix for the security group Name tag and resource name"
  type        = string
  default     = "ec2-sg"
}

variable "instance_name_suffix" {
  description = "Suffix appended to name_prefix for the EC2 instance Name tag"
  type        = string
  default     = "app"
}

variable "ssh_port" {
  description = "TCP port to allow for SSH ingress"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "TCP port to allow for HTTP ingress"
  type        = number
  default     = 80
}

variable "egress_from_port" {
  description = "Starting port for the egress rule"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Ending port for the egress rule"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Protocol for the egress rule"
  type        = string
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "Allowed CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
