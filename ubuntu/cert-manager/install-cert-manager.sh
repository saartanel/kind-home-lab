#!/bin/bash

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install CustomResourceDefinitions
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml

# Install cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.8.0