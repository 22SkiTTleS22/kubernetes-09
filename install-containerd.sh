#!/usr/bin/env bash
set -euo pipefail

echo "Installing containerd on $(hostname)"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y containerd

mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' \
  /etc/containerd/config.toml

systemctl enable containerd
systemctl restart containerd
systemctl is-active --quiet containerd

containerd --version
ctr plugins ls | grep 'io.containerd.grpc.v1.*cri'

echo "Installation complete: $(hostname)"

