# Kubernetes Task-2 — AWS EKS + Nginx Deployment

## Objective
Create an AWS EKS cluster using eksctl, deploy Nginx application,
and access it outside the cluster via LoadBalancer service.

---

## Author
- **Name:** Asheesh Nehra
- **GitHub:** [nehraashish972-cloud](https://github.com/nehraashish972-cloud)
- **Date:** April 04, 2026

---

## Tech Stack Used

| Tool      | Version      | Purpose                        |
|-----------|--------------|--------------------------------|
| AWS EKS   | Latest       | Managed Kubernetes cluster     |
| eksctl    | 0.224.0      | EKS cluster creation tool      |
| kubectl   | Latest       | Kubernetes CLI tool            |
| AWS CLI   | 2.x          | AWS authentication & config    |

---

## Prerequisites
- AWS Account with IAM user having AdministratorAccess
- WSL2 with Ubuntu 22.04
- AWS CLI configured with Access Key and Secret Key
- eksctl and kubectl installed

---

## Installation Steps

### 1. AWS CLI Installation
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws --version

### 2. AWS Configure
    aws configure
    # Enter Access Key ID, Secret Key, Region: ap-south-1, Format: json
    aws sts get-caller-identity

### 3. eksctl Installation
    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz"
    tar -xzf eksctl_Linux_amd64.tar.gz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    eksctl version

### 4. kubectl Installation
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version --client

---

## EKS Cluster Creation

### Command Used
    eksctl create cluster \
      --name nginx-cluster \
      --region ap-south-1 \
      --nodegroup-name ng-workers \
      --node-type t2.small \
      --nodes 2 \
      --nodes-min 1 \
      --nodes-max 2 \
      --managed

### Cluster Verified
    eksctl get cluster --region=ap-south-1
    aws eks update-kubeconfig --region ap-south-1 --name nginx-cluster

---

## Nginx Deployment

### Deploy Application
    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml
    kubectl get pods
    kubectl get service nginx-service

### Access Application
    # Get External IP
    kubectl get service nginx-service
    # Open in browser: http://<EXTERNAL-IP>

---

## Issue Encountered & Resolution

### Problem
During EKS nodegroup creation, EC2 instance launch failed with error:
    "Could not launch On-Demand Instances - InvalidParameterCombination.
    The specified instance type is not eligible for Free Tier."

Tried instance types: t3.medium, t2.micro, t2.small

### Root Cause
AWS new account has default EC2 vCPU quota set to 0 for
On-Demand Standard instances in ap-south-1 region.

### Steps Taken to Resolve
1. Checked CloudFormation stack events for exact error
2. Navigated to AWS Service Quotas console
3. Requested quota increase for "Running On-Demand Standard instances"
4. Encountered "Signature expired" error due to WSL2 time sync issue
5. Quota increase request pending AWS approval (takes 2-4 hours)

### Current Status
- EKS Control Plane: Successfully created
- NodeGroup: Failed due to EC2 quota limit
- Quota increase request: Submitted to AWS
- Task will be fully completed once quota is approved

---

## YAML Files

### nginx-deployment.yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deployment
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: nginx
      template:
        metadata:
          labels:
            app: nginx
        spec:
          containers:
          - name: nginx
            image: nginx:latest
            ports:
            - containerPort: 80

### nginx-service.yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: nginx-service
    spec:
      selector:
        app: nginx
      type: LoadBalancer
      ports:
      - protocol: TCP
        port: 80
        targetPort: 80

---

## Key Learnings
- EKS is AWS managed Kubernetes service — no need to manage control plane
- eksctl simplifies cluster creation with single command
- LoadBalancer service type exposes app outside cluster via AWS ELB
- New AWS accounts have strict EC2 vCPU quotas by default
- Service Quotas must be increased before launching EC2 instances at scale

---

## References
- AWS EKS Docs: https://docs.aws.amazon.com/eks/latest/userguide/
- eksctl Docs: https://eksctl.io/
- Kubectl Docs: https://kubernetes.io/docs/reference/kubectl/
- AWS Service Quotas: https://docs.aws.amazon.com/servicequotas/
