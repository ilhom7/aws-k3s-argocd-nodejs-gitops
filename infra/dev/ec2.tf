module "k3s_server" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v6.4.0"

  name = "k3s-argocd-nodejs-dev"

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name               = aws_key_pair.k3s_key.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [module.k3s_security_group.security_group_id]

  associate_public_ip_address = true

  user_data = file("${path.module}/user-data.sh")

  root_block_device = {
    size = 20
    type = "gp3"
  }

  tags = {
    Project = var.project_name
  }
}