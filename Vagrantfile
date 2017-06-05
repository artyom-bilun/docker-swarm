# -*- mode: ruby -*-
# vi: set ft=ruby :

manager_ip = "192.168.33.10"
worker_1_ip = "192.168.33.11"

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "manager" do |m|
    m.vm.network "private_network", ip: "#{manager_ip}"
    m.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      # vb.customize [ "modifyvm", :id, "--nictype1", "virtio" ]
      # vb.customize [ 'modifyvm', :id, '--natdnshostresolver1', 'on' ]
      # vb.customize [ 'modifyvm', :id, '--natdnsproxy1', 'on' ]
    end
    m.vm.provision :shell, path: "provision/scripts/docker.sh"
    m.vm.provision :shell, args: ["#{manager_ip}"],
     path: "provision/scripts/manager.sh"
    m.vm.provision :shell, path: "provision/scripts/docker-compose.sh"
  end

  config.vm.define "worker-1" do |w|
    w.vm.network "private_network", ip: "#{worker_1_ip}"
    w.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    w.vm.provision :shell, path: "provision/scripts/docker.sh"
    w.vm.provision :shell,
     args: [ "#{manager_ip}", "#{worker_1_ip}" ],
     path: "provision/scripts/worker.sh"
  end

end


# TCP port 2377 for cluster management communications
# TCP and UDP port 7946 for communication among nodes
# UDP port 4789 for overlay network traffic