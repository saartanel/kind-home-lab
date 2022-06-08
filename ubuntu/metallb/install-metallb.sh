#!/bin/bash

# https://kind.sigs.k8s.io/docs/user/loadbalancer/

# Create the metallb namespace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml

# Create metallb loadbalancer ip pool configmap
kubectl apply -f /home/vagrant/lb-pool-cm.yaml

# Apply metallb manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml

# Sleep for abit to wait for pod creation
sleep 15