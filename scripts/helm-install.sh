#!/bin/bash
set -e

NAMESPACE="kyverno"

echo ">>> Creating namespace: $NAMESPACE"
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo ">>> Adding Kyverno Helm repo"
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

echo ">>> Installing Kyverno"
helm upgrade --install kyverno kyverno/kyverno \
  --namespace $NAMESPACE \
  -f charts/kyverno/kyverno-values.yaml

echo ">>> Kyverno installation complete!"
