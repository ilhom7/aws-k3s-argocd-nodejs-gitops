variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "aws-k3s-argocd-nodejs-gitops"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/k3s-gitops-key.pub"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format for SSH access"
  type        = string
}