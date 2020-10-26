#!/usr/bin/env bash

# Source bash completion the k8s-tools
source <(kubeadm completion bash)
source <(kubectl completion bash)
source <(helm completion bash)