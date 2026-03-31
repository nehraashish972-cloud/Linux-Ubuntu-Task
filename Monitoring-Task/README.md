# Monitoring Task - Prometheus & Grafana Setup on AWS EC2

## Overview
This task demonstrates how to install and configure Prometheus and Grafana on an AWS EC2 instance (Ubuntu 22.04) for system monitoring.

## Tools Used
- **AWS EC2** - Ubuntu 22.04 LTS (t2.micro)
- **Node Exporter v1.7.0** - System metrics collector
- **Prometheus v2.51.0** - Metrics storage and querying
- **Grafana** - Metrics visualization and dashboarding

## Steps Performed

### 1. EC2 Instance Setup
- Launched Ubuntu 22.04 EC2 instance on AWS
- Configured Security Group with ports: 22, 9090, 9100, 3000
- Connected via SSH from WSL

### 2. Node Exporter Installation
- Downloaded and installed Node Exporter v1.7.0
- Created systemd service for auto-start
- Verified running on port 9100

### 3. Prometheus Installation
- Downloaded and installed Prometheus v2.51.0
- Configured prometheus.yml with Node Exporter scrape target
- Created systemd service for auto-start
- Verified running on port 9090

### 4. Grafana Installation
- Installed Grafana via apt package manager
- Created systemd service for auto-start
- Verified running on port 3000

### 5. Integration
- Connected Prometheus as Data Source in Grafana
- Imported Node Exporter Full Dashboard (ID: 1860)

## Access URLs
- Prometheus: http://65.2.191.49:9090
- Grafana: http://65.2.191.49:3000

## Screenshots
All screenshots are included in the Word document uploaded in this folder.

