# Kubernetes Task — Minikube + Namespaces

## Objective
Set up Minikube on local system using WSL2 and Docker, and explore creating and managing Kubernetes Namespaces using kubectl.

---

## Author
- **Name:** Asheesh Nehra
- **GitHub:** [nehraashish972-cloud](https://github.com/nehraashish972-cloud)
- **Date:** April 04, 2026

---

## Tech Stack Used

| Tool     | Version      | Purpose                      |
|----------|--------------|------------------------------|
| WSL2     | Ubuntu 22.04 | Linux environment on Windows |
| Docker   | 29.3.1       | Container runtime / driver   |
| Minikube | Latest       | Local Kubernetes cluster     |
| Kubectl  | Latest       | Kubernetes CLI tool          |

---

## Prerequisites
- Windows 10/11 with WSL2 enabled
- Ubuntu 22.04 installed inside WSL2
- Docker installed and running inside WSL2
- Internet connection for pulling images

---

## Setup Steps

### 1. Docker Installation
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo service docker start
    sudo usermod -aG docker $USER
    docker run hello-world

### 2. Minikube Installation
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    minikube version

### 3. Kubectl Installation
    curl -LO https://dl.k8s.io/release/stable.txt
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version --client

### 4. Start Minikube Cluster
    minikube start --driver=docker
    minikube status

### 5. Namespace Creation

#### Method 1 — kubectl command se
    kubectl create namespace dev
    kubectl create namespace staging

#### Method 2 — YAML file se
    kubectl apply -f production-namespace.yaml

#### Verify
    kubectl get namespaces

### 6. Namespace Exploration
    kubectl describe namespace dev
    kubectl run nginx-pod --image=nginx --namespace=dev
    kubectl get pods --namespace=dev
    kubectl get pods --all-namespaces
    kubectl delete namespace staging

---

## Namespaces Created

| Namespace | Method      | Purpose                     |
|-----------|-------------|-----------------------------|
| dev       | kubectl CLI | Development environment      |
| staging   | kubectl CLI | Staging/testing environment  |

---

## Project Structure

    Kubernetes Task/
    README.md                   - This file
    production-namespace.yaml   - YAML manifest for namespace

---

## Key Learnings
- Minikube runs a single-node Kubernetes cluster locally using Docker as the driver
- Namespaces help isolate resources within a Kubernetes cluster
- kubectl CLI and YAML manifests are two ways to manage Kubernetes resources
- WSL2 provides a seamless Linux environment on Windows for DevOps tasks

---

## References
- Minikube Official Docs: https://minikube.sigs.k8s.io/docs/
- Kubectl Official Docs: https://kubernetes.io/docs/reference/kubectl/
- Kubernetes Namespaces: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
