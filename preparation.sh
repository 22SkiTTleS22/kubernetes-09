#!/usr/bin/env bash
set -euo pipefail

echo "Preparing $(hostname)"

swapoff -a
sed -i.bak '/^[[:space:]]*#/!{/[[:space:]]swap[[:space:]]/s/^/#/;}' /etc/fstab

printf 'overlay\nbr_netfilter\n' > /etc/modules-load.d/k8s.conf

modprobe overlay
modprobe br_netfilter

printf '%s\n' \
  'net.bridge.bridge-nf-call-iptables = 1' \
  'net.bridge.bridge-nf-call-ip6tables = 1' \
  'net.ipv4.ip_forward = 1' \
  > /etc/sysctl.d/99-kubernetes.conf

sysctl --system

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ca-certificates curl gpg apt-transport-https

echo "Preparation complete: $(hostname)"

