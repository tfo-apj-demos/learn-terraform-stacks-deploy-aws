output "instance_ids" {
  description = "ID of instance."
  value       = aws_instance.private.*.id
}

output "private_dns" {
  description = "IP address of instance."
  value       = aws_instance.private.*.private_dns
}
