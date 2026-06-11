module "k3s_security_group" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v5.3.0"

  name        = "${var.project_name}-sg"
  description = "Security group for k3s GitOps project"
  vpc_id      = data.aws_vpc.default.id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = var.my_ip_cidr
      description = "SSH from my IP"
    },
    {
      from_port   = 30080
      to_port     = 30080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Node.js app NodePort"
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "HTTP optional"
    }
  ]

  egress_rules = ["all-all"]

  tags = {
    Name    = "${var.project_name}-sg"
    Project = var.project_name
  }
}