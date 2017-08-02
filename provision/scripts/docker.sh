#!/bin/bash 

# install docker-ce 
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install docker-ce -y

systemctl enable docker
systemctl start docker

# To work with docker cli without sudo
usermod -aG docker vagrant