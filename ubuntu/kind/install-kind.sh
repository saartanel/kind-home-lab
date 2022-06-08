#!/bin/bash

# https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries

# Download kind binary
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64

# Ensure kind binary is executable
chmod +x ./kind

# Move kind binary to folder in PATH
mv ./kind /usr/local/bin/kind