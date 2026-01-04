# Kind Cluster Setup

## Create Cluster
To create a kind cluster with the specified configuration and name:

```bash
kind create cluster --config kind-config.yml --name kind-cluster
```

## Load Images
If necessary, you can pull and load specific images into the kind cluster. This is useful for pre-loading images to avoid downloading them inside the cluster.

### Pull Images
```bash
docker pull quay.io/cilium/cilium:v1.16.0
docker pull quay.io/cilium/cilium-envoy:v1.29.7-39a2a56bbd5b3a591f69dbca51d3e30ef97e0e51
```

### Load Images into Kind
```bash
kind load docker-image quay.io/cilium/cilium:v1.16.0 --name kind-cluster
kind load docker-image quay.io/cilium/cilium-envoy:v1.29.7-39a2a56bbd5b3a591f69dbca51d3e30ef97e0e51 --name kind-cluster
```

## Install Cilium
```bash
helm install cilium cilium/cilium --version 1.16.0 \
   --namespace kube-system \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes \
   --set operator.replicas=1 \
   --set image.useDigest=false \
   --set operator.image.useDigest=false \
   --set envoy.image.useDigest=false
```
