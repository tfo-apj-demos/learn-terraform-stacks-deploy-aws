output "intance_ids" {
  type        = list(tuple)
  description = "EC2 instance IDs"
  value       = [for x in component.instance : x.instance_ids]
}

output "intance_private_dns" {
  type        = list(tuple)
  description = "EC2 instance Private DNS names"
  value       = [for x in component.instance : x.private_dns]
}
