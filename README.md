# 🚀 EKS Kyverno Policies

This repository contains **production-ready Kyverno Helm values and policies** to secure and standardize workloads running on **AWS EKS**.  

Kyverno is a **Kubernetes-native policy engine** that allows you to **validate, mutate, and generate configurations** in your cluster without needing to learn a new language.  
Think of it as **Kubernetes' security + compliance enforcer**.

---

## 📂 Repository Structure
```
eks-kyverno-policies/
├── charts/
│ └── kyverno/
│ └── kyverno-values.yaml # Helm overrides for production-ready Kyverno
├── policies/
│ ├── commands.yaml # Example CLI-based policy commands
│ ├── disallow-latest-tag.yaml # Block :latest image tags
│ ├── generate-namespace-config.yaml # Auto-generate namespace configs
│ ├── kyverno-values.yaml # Policy-specific values
│ └── mutate-add-defaults.yaml # Add default labels/annotations
├── scripts/
│ └── helm-install.sh # Script to install Kyverno via Helm
└── README.md # Documentation (this file)
```