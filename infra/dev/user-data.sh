#!/bin/bash
set -e

apt-get update -y
apt-get install -y curl git

curl -sfL https://get.k3s.io | sh -

mkdir -p /home/ubuntu/.kube
cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
chown -R ubuntu:ubuntu /home/ubuntu/.kube

echo "alias k='sudo kubectl'" >> /home/ubuntu/.bashrc