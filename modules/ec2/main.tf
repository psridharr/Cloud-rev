locals {
  module_version = "v1.0.0"
}

resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-${var.security_group_name_suffix}"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_http_cidrs
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-${var.security_group_name_suffix}"
  })
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name               = var.key_name

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-${var.instance_name_suffix}"
  })
}
