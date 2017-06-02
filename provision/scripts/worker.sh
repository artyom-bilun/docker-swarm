#!/bin/bash

MANAGER_IP=$1
WORKER_IP=$2

TOKEN=$(cat /vagrant/worker_token)

docker swarm join --listen-addr ${WORKER_IP}:2377 --advertise-addr ${WORKER_IP} --token=${TOKEN} ${MANAGER_IP}:2377