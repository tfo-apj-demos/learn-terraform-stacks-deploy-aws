# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vpc_id" {
  description = "The ID of the VPC created."
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "IDs of all of the private subnets."
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "IDs of all of the public subnets."
  value       = module.vpc.public_subnets
}

output "security_group_id_ssh" {
  description = "ID of the SSH security group."
  value       = aws_security_group.allow_ssh.id
}
