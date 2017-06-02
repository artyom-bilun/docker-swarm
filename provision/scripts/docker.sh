#!/bin/bash 

# install docker-ce 
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install docker-ce -y

# Add EPAM DNS servers instead of google's 8.8.8.8
/bin/cp /vagrant/daemon.json /etc/docker/daemon.json

systemctl enable docker
systemctl start docker

# To work with docker cli without sudo
usermod -aG docker vagrant