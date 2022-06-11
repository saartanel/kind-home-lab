#!/bin/bash

# https://haproxy-ingress.github.io/docs/getting-started/#installation

# Add the HAProxy Ingress’ Helm repository
helm repo add haproxy-ingress https://haproxy-ingress.github.io/charts

# Install HAProxy Ingress using haproxy-ingress as the release name and haproxy-ingress-values.yaml file as the custom parameters:
helm install haproxy-ingress haproxy-ingress/haproxy-ingress --create-namespace --namespace ingress-controller --version 0.13.7 -f /home/vagrant/haproxy-ingress-values.yaml

# Sleep for abit to wait for pod creation
sleep 20