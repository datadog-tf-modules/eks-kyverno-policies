#!/usr/bin/env bash
# Helm install script for Kyverno (production example)
# Usage: edit kyverno-values.yaml then run: ./helm-install.sh

set -euo pipefail

# Add kyverno repo and update
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

# Install Kyverno into the 'kyverno' namespace using the example values file
helm upgrade --install kyverno kyverno/kyverno \
  --namespace kyverno --create-namespace \
  -f kyverno-values.yaml
