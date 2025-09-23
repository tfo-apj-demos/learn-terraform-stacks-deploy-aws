output "intance_ips" {
  type        = list(string)
  description = "Private IPs of EC2 instances"
  value       = [for x in component.instance : x.invoke_arn]
}
