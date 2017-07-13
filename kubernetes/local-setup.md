# Local Kubernetes Setup

## Deployment Types
There are a couple of ways to get local K8S running:
1. [Single-node](#single-node-options) (Master, Etcd, and Nodes all reside in a single VM)
1. [Multi-node](#multi-node-options) (Separate VMs for each role, multiples of each if you wish)

## Single-node Options
1. [minikube](#minikube) ([docs](https://kubernetes.io/docs/getting-started-guides/minikube/))

## Multi-node Options
1. [CoreOS Multi-node: Vagrant](#coreos-multi-node-vagrant) ([docs](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html))
1. [nkube](#nkube) ([github](https://github.com/marun/nkube)) -- Each "node" runs as a Docker container which itself runs docker.
