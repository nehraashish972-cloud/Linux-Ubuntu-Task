# Terraform Task - Launch EC2 in Two AWS Regions

## Overview
Launch Linux EC2 instances in two different AWS regions 
using a single Terraform configuration file.

## Regions Used
- ap-south-1 (Mumbai)
- us-east-1 (N. Virginia)

## Tools Used
- Terraform v1.14.8
- AWS CLI
- WSL (Ubuntu 22.04)

## Files
- main.tf - Main Terraform configuration

## Commands Used
- terraform init
- terraform plan
- terraform apply
- terraform destroy

## Output
- Mumbai Instance ID: i-0bbcb43658ee3b09d
- Mumbai Public IP: 13.235.9.236
- Virginia Instance ID: i-0439079b65bc7c60b
- Virginia Public IP: 44.221.46.230

