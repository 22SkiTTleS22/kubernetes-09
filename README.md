Подготовка ОС, скрипт preparation.sh
os
Установка containerd, скрипт install-containerd.sh
containerd
Установка kubernetes, скрипт install-kubernetes.sh
kuber
Создание кластера на k8s-master
sudo kubeadm init \
    --kubernetes-version=v1.34.13 \
    --apiserver-advertise-address=192.168.56.10 \
    --pod-network-cidr=10.244.0.0/16 \
    --service-cidr=10.96.0.0/12 \
    --cri-socket=unix:///run/containerd/containerd.sock \
    --node-name=k8s-master

kuber 2
itog
Сеть кластера настраивается с установкой Calico в задании 3.3
