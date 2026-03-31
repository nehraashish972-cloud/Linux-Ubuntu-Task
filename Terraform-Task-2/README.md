# Terraform Task-2 - EC2 with Nginx in Two AWS Regions

## Overview
Launch EC2 instances in two different AWS regions and 
automatically install Nginx using Terraform user_data script.

## Regions Used
- ap-south-1 (Mumbai)
- us-east-1 (N. Virginia)

## Tools Used
- Terraform v1.14.8
- AWS CLI
- WSL (Ubuntu 22.04)

## Files
- main.tf - Main Terraform configuration with Nginx installation

## Commands Used
- terraform init
- terraform plan
- terraform apply

## Output
- Mumbai Instance ID: i-0866361ab3a87a32a
- Mumbai Public IP: 13.233.65.224
- Virginia Instance ID: i-08d20f8c494ae9b82
- Virginia Public IP: 100.54.91.52

## Nginx Verification
- Mumbai: http://13.233.65.224
- Virginia: http://100.54.91.52

