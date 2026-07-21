# devpod-template-k8s

DevContainer setup tailored for **DevPod** with the **Kubernetes (k8s) provider**.

## Overview

This setup allows you to spin up a fully isolated development container directly inside a Kubernetes cluster using [DevPod](https://devpod.sh/).

Included tools:
- **Kubernetes**: `kubectl`, `helm`, `kubectx`, `k9s`
- **Cloud & IaC**: `azure-cli`, `kubelogin`, `terraform`
- **Developer utilities**: `zsh`, `starship`, `lazygit`, `fzf`, `ripgrep`, `tmux`, `eza`, `neovim`, `gh`, `node`/`nvm`, `python`, `go`, `rust`

## Prerequisites

1. Install [DevPod CLI](https://devpod.sh/docs/getting-started/install) or DevPod Desktop.
2. Access to a Kubernetes cluster (e.g. Kind, Minikube, GKE, EKS, AKS).

## Quickstart

### 1. Add Kubernetes Provider in DevPod

```bash
devpod provider add k8s
```

You can configure options like namespace, kubeconfig path, or context during setup.

### 2. Launch Development Environment

Run DevPod pointing to this repository using the Kubernetes provider:

```bash
devpod up . --provider k8s
```

DevPod will:
1. Build the Docker image defined in `.devcontainer/Dockerfile`.
2. Schedule a Pod in your Kubernetes cluster.
3. Synchronize workspace files into `/workspace`.
4. Open your preferred IDE (VS Code, Cursor, SSH, CLI, etc.) connected directly to the Kubernetes Pod.

## Kind Cluster Setup (Optional Local Testing)

If you wish to test with a local Kind cluster, see [`kind/README.md`](kind/README.md).