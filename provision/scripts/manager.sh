#!/bin/bash 

MANAGER_IP=$1

docker swarm init --advertise-addr ${MANAGER_IP}
docker swarm join-token -q worker > /vagrant/worker_token