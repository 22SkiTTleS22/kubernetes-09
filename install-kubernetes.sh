#!/usr/bin/env bash
set -euo pipefail

echo "Installing Kubernetes tools on $(hostname)"

mkdir -p /etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key \
  | gpg --dearmor --yes -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

printf '%s\n' \
  'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /' \
  > /etc/apt/sources.list.d/kubernetes.list

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y \
  kubelet kubeadm kubectl

apt-mark hold kubelet kubeadm kubectl
systemctl enable kubelet

node_ip=$(ip -4 -o addr show dev enp0s8 | awk '{print $4}' | cut -d/ -f1)
test -n "$node_ip"

printf 'KUBELET_EXTRA_ARGS=--node-ip=%s\n' "$node_ip" \
  > /etc/default/kubelet

kubeadm version -o short
kubectl version --client

echo "Installation complete: $(hostname), node IP: $node_ip"

