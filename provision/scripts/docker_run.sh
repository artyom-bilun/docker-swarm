#!/bin/bash 

docker load -i /vagrant/centos_7.tar


docker build -f /vagrant/docker/httpd/Dockerfile -t mnt_httpd .
docker service  create --name httpd -p 80:80 mnt_httpd