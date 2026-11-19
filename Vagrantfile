Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-focal-local"
  config.vm.box_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-vagrant.box"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.boot_timeout = 600

  nodes = [
    ["k8s-master",  "192.168.56.10", 4096],
    ["k8s-worker1", "192.168.56.11", 2048],
    ["k8s-worker2", "192.168.56.12", 2048],
    ["k8s-worker3", "192.168.56.13", 2048],
    ["k8s-worker4", "192.168.56.14", 2048]
  ]

  nodes.each do |name, ip, memory|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: ip

      node.vm.provider "virtualbox" do |vb|
        vb.name = "netology-09-#{name}"
        vb.cpus = 2
        vb.memory = memory
        vb.gui = false
      end
    end
  end
end

