#!/bin/bash

sudo apt install jq -y

SERVICE_ACCOUNT_NAME="nginx-sa"

NAMESPACE="default"

TOKEN_NAME="${SERVICE_ACCOUNT_NAME}-token"

kubectl create sa "${SERVICE_ACCOUNT_NAME}" --namespace "${NAMESPACE}"

CONFIG_PATH="/tmp/kube"

KUBECONFIG_FILE_NAME="${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-conf"

kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: "${TOKEN_NAME}"
  namespace: "${NAMESPACE}"
  annotations:
    kubernetes.io/service-account.name: "${SERVICE_ACCOUNT_NAME}"
type: kubernetes.io/service-account-token
EOF

kubectl -n "${NAMESPACE}" get secret "${TOKEN_NAME}" -o json | jq -r '.data["ca.crt"]' | base64 -d > "${CONFIG_PATH}/ca.crt"

USER_TOKEN=$(kubectl get secret "${TOKEN_NAME}" -o json | jq -r '.data["token"]' | base64 -d)

context=$(kubectl config current-context)

CLUSTER_NAME=$(kubectl config get-contexts "$context" | awk '{print $3}' | tail -n 1)

ENDPOINT=$(kubectl config view -o jsonpath="{.clusters[?(@.name == \"${CLUSTER_NAME}\")].cluster.server}")

kubectl config set-cluster "${CLUSTER_NAME}" --kubeconfig="${CONFIG_PATH}/${KUBECONFIG_FILE_NAME}" --server="${ENDPOINT}" --certificate-authority="${CONFIG_PATH}/ca.crt" --embed-certs=true

kubectl config set-credentials "${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-${CLUSTER_NAME}" --kubeconfig="${CONFIG_PATH}/${KUBECONFIG_FILE_NAME}" --token="${USER_TOKEN}"

kubectl config set-context "${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-${CLUSTER_NAME}" --kubeconfig="${CONFIG_PATH}/${KUBECONFIG_FILE_NAME}" --cluster="${CLUSTER_NAME}" --user="${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-${CLUSTER_NAME}"

kubectl config use-context "${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-${CLUSTER_NAME}" --kubeconfig="${CONFIG_PATH}/${KUBECONFIG_FILE_NAME}"

#kubectl config use-context "${SERVICE_ACCOUNT_NAME}-${CLUSTER_NAME}"