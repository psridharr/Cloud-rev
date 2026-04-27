variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "enable_dns_support" {
  description = "Whether to enable DNS resolution support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Whether instances launched in public subnets receive public IPs by default"
  type        = bool
  default     = true
}

variable "public_route_cidr" {
  description = "Destination CIDR block for the default public route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_tier_tag_value" {
  description = "Tier tag value assigned to public subnets"
  type        = string
  default     = "public"
}

variable "private_tier_tag_value" {
  description = "Tier tag value assigned to private subnets"
  type        = string
  default     = "private"
}
