resource "aws_key_pair" "k3s_key" {
  key_name   = "${var.project_name}-key"
  public_key = file(pathexpand(var.public_key_path))

  tags = {
    Name    = "${var.project_name}-key"
    Project = var.project_name
  }
}