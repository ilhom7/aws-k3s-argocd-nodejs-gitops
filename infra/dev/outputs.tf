output "ec2_public_ip" {
  description = "Public IP of the k3s server"
  value       = module.k3s_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the k3s server"
  value       = module.k3s_server.public_dns
}

output "security_group_id" {
  description = "Security group ID"
  value       = module.k3s_security_group.security_group_id
}

output "ssh_command" {
  description = "SSH command"
  value       = "ssh -i ~/.ssh/k3s-gitops-key ubuntu@${module.k3s_server.public_ip}"
}

output "app_url" {
  description = "Node.js app URL"
  value       = "http://${module.k3s_server.public_ip}:30080"
}