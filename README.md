# 🚀 EKS Kyverno Policies

This repository contains **production-ready Kyverno Helm values and policies** to secure and standardize workloads running on **AWS EKS**.  

Kyverno is a **Kubernetes-native policy engine** that allows you to **validate, mutate, and generate configurations** in your cluster without needing to learn a new language.  
Think of it as **Kubernetes' security + compliance enforcer**.

---

## ✅ Prerequisites
- Kubernetes cluster (**AWS EKS** recommended)
- `kubectl` installed and configured
- `helm` (v3 or later)
- AWS CLI configured (if using EKS)

---

## 📂 Repository Structure
```text
eks-kyverno-policies/
├── charts/
│   └── kyverno/
│       └── kyverno-values.yaml   # Helm overrides for production-ready Kyverno
│
├── policies/
│   ├── commands.yaml             # Example CLI-based policy commands
│   ├── disallow-latest-tag.yaml  # Block :latest image tags
│   ├── generate-namespace-config.yaml # Auto-generate namespace configs
│   ├── kyverno-values.yaml       # Policy-specific values
│   └── mutate-add-defaults.yaml  # Add default labels/annotations
│
├── scripts/
│   └── helm-install.sh           # Script to install Kyverno via Helm
│
└── README.md                     # Documentation (this file)
```

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/eks-kyverno-policies.git
cd eks-kyverno-policies
```

### 2. Install Kyverno with Helm
Ensure you have Helm and kubectl configured for your cluster.

```bash
# Add Kyverno Helm repo
helm repo add kyverno https://kyverno.github.io/kyverno/

# Update repos
helm repo update

# Install Kyverno using custom values
helm install kyverno kyverno/kyverno -n kyverno --create-namespace -f charts/kyverno/kyverno-values.yaml
```

### 3. Apply Policies
Once Kyverno is installed, apply the policies from the `policies/` folder:

```bash
kubectl apply -f policies/
```

This will install:
- Disallow latest image tag
- Mutate resources to add defaults
- Generate namespace configurations
- Restrict dangerous commands

### 4. Verify Installation
```bash
# Check if Kyverno pods are running
kubectl get pods -n kyverno

# Check if policies are applied
kubectl get cpol
```

---

## 📘 Example Policies

| Policy File                   | Description                                |
|--------------------------------|--------------------------------------------|
| `disallow-latest-tag.yaml`     | Prevents workloads from using `:latest` image tag |
| `mutate-add-defaults.yaml`     | Ensures resources have default labels/annotations |
| `generate-namespace-config.yaml` | Auto-generates ConfigMaps for new namespaces |
| `commands.yaml`                | Restricts dangerous commands in containers |

### 🔍 Test Example
```bash
# Test disallow latest policy
kubectl run test --image=nginx:latest
# Should be blocked by Kyverno
```

---

## 🛠 Automation Script
You can also use the provided script to install Kyverno and apply policies in one go:
```bash
./scripts/helm-install.sh && kubectl apply -f policies/
```

--- 
- **.gitignore** → to exclude unwanted files (e.g., logs, IDE configs)  
- **examples/** → sample workloads to test policies (e.g., nginx deployment with `:latest`)  
- **CI/CD workflow (GitHub Actions)** → to validate Helm charts and lint YAML files  
- **CONTRIBUTING.md** → guide for external contributors  

---

## 🌍 Useful Links
- [Kyverno Documentation](https://kyverno.io/docs/?utm_source=chatgpt.com)
- [Helm Kyverno Chart](https://artifacthub.io/packages/helm/kyverno/kyverno?utm_source=chatgpt.com)

---

## 🤝 Contributing
Feel free to fork this repo and add more policies!  
You can create pull requests for:
- New security policies
- Improvements to Helm values
- Automation scripts

---

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Kubernetes](https://img.shields.io/badge/k8s-1.28%2B-blue)
![Helm](https://img.shields.io/badge/helm-v3-blue)
