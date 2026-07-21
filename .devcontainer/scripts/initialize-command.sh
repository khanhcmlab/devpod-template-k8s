#!/bin/bash
set -Eeuo pipefail

SCRIPTDIR=$(realpath $(dirname "$0"))
REPO_URL=$(git config --get remote.origin.url || echo "devpod-template-k8s")
REPO_NAME=$(basename -s .git "${REPO_URL:-devpod-template-k8s}")
REPO_PROJECT="devpod"

error() {
    echo "Error during initialization"
    exit 1
}

trap error ERR

create_directories() {
    echo "Creating persistent local directories..."
    mkdir -p "${HOME}/.ssh/"
    mkdir -p "${HOME}/.local/"
    mkdir -p "${HOME}/.gnupg/"
    mkdir -p "${HOME}/.${REPO_PROJECT}/pre-commit-cache/"
    mkdir -p "${HOME}/.${REPO_PROJECT}/commandhistory.d/${REPO_NAME}/"
}

create_files() {
    echo "Creating persistent local files..."
    touch "${HOME}/.${REPO_PROJECT}/zsh-history"
    touch "${HOME}/.gitconfig"
    touch "${HOME}/.netrc"
    chmod 600 "${HOME}/.netrc"
}

main() {
    echo "Initialization started..."
    create_directories
    create_files
    echo "Initialization completed."
}

main "$@"