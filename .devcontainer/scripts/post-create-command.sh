#!/bin/bash
set -Eeuo pipefail

error() {
    echo "Error during post-create setup"
    exit 1
}

trap error ERR

main() {
    echo "Post Create Command started..."

    if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi

    # Install Azure CLI if needed
    if ! command -v az &>/dev/null; then
        echo "Installing Azure CLI..."
        brew install azure-cli || echo "Azure CLI installation skipped or failed."
    else
        echo "Azure CLI is already installed."
    fi

    # Install kubectx if needed
    if ! command -v kubectx &>/dev/null; then
        echo "Installing kubectx..."
        brew install kubectx || echo "kubectx installation skipped or failed."
    else
        echo "kubectx is already installed."
    fi

    # Install kubectl if needed
    if ! command -v kubectl &>/dev/null; then
        echo "Installing kubectl..."
        brew install kubectl || echo "kubectl installation skipped or failed."
    else
        echo "kubectl is already installed."
    fi

    # Install helm if needed
    if ! command -v helm &>/dev/null; then
        echo "Installing helm..."
        brew install helm || echo "helm installation skipped or failed."
    else
        echo "helm is already installed."
    fi

    # Install Terraform if needed
    if ! command -v terraform &>/dev/null; then
        echo "Installing Terraform..."
        brew tap hashicorp/tap || true
        brew install hashicorp/tap/terraform || echo "Terraform installation skipped or failed."
    else
        echo "Terraform is already installed."
    fi

    # Install Azure Kubelogin if needed
    if ! command -v kubelogin &>/dev/null; then
        echo "Installing Azure Kubelogin..."
        brew install Azure/kubelogin/kubelogin || echo "Azure Kubelogin installation skipped or failed."
    else
        echo "Azure Kubelogin is already installed."
    fi

    echo "Post Create Command completed."
}

main "$@"