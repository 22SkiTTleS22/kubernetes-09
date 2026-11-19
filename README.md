Подготовка ОС, скрипт preparation.sh

<img width="2174" height="464" alt="k8s-09-os" src="https://github.com/user-attachments/assets/f59393b2-6b3e-49e7-aa6a-a97ea43ffe01" />

Установка containerd, скрипт install-containerd.sh

<img width="2538" height="691" alt="k8s-09-containerd" src="https://github.com/user-attachments/assets/16cd7a8d-a0ac-4655-92d0-2a5cd4254f95" />

Установка kubernetes, скрипт install-kubernetes.sh

<img width="2091" height="578" alt="k8s-09-kuber" src="https://github.com/user-attachments/assets/21fb952b-5f83-4d02-bc6a-e02f4b9af515" />

Создание кластера на k8s-master
sudo kubeadm init \
    --kubernetes-version=v1.34.13 \
    --apiserver-advertise-address=192.168.56.10 \
    --pod-network-cidr=10.244.0.0/16 \
    --service-cidr=10.96.0.0/12 \
    --cri-socket=unix:///run/containerd/containerd.sock \
    --node-name=k8s-master

<img width="1919" height="279" alt="k8s-09-kuber2" src="https://github.com/user-attachments/assets/d86b7db1-f93e-414f-ae85-7f41844fa999" />

<img width="1980" height="280" alt="k8s-09-itog" src="https://github.com/user-attachments/assets/7cec4893-8eef-425c-ba25-1110c023db1d" />
Сеть кластера настраивается с установкой Calico в задании 3.3
<img width="2135" height="604" alt="k8s-09-calico" src="https://github.com/user-attachments/assets/96525798-39ac-477a-bc7b-ead1770633c1" />
