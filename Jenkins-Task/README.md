# Jenkins Task - AWS EC2

## Objective
Launch Jenkins on AWS EC2 and explore creating projects and users.

## Tech Stack
- AWS EC2 (t3.micro, Ubuntu 22.04 LTS)
- Jenkins 2.541.3
- Java 17 (OpenJDK)
- WSL (Windows Subsystem for Linux)
- AWS CLI v2

## Prerequisites
- AWS Account with IAM user and Access Keys
- WSL installed on Windows
- AWS CLI configured in WSL
- Key Pair (.pem file) for SSH access

## Steps Performed

### 1. AWS EC2 Setup (via WSL)
- Configured AWS CLI with IAM credentials
- Created Security Group `jenkins-sg` with:
  - Port 22 (SSH) - My IP only
  - Port 8080 (Jenkins) - Open to all
- Launched EC2 instance:
  - Instance Type: t3.micro
  - AMI: Ubuntu 22.04 LTS
  - Storage: 20 GiB gp3
- Connected to EC2 via SSH from WSL terminal

### 2. Jenkins Installation on EC2
- Updated system packages
- Installed Java 17 (OpenJDK)
- Added Jenkins GPG key and repository
- Installed Jenkins 2.541.3
- Started Jenkins service and enabled on boot
- Verified Jenkins status: active (running)

### 3. Jenkins Initial Setup
- Accessed Jenkins at http://13.201.59.109:8080
- Unlocked Jenkins using initial admin password
- Installed suggested plugins
- Created admin user account
- Completed instance configuration

### 4. Projects Created

#### Freestyle Project - hello-world
- Type: Freestyle Project
- Build Step: Execute Shell
- Script:
```bash
  echo "Hello from Jenkins!"
  echo "Build Number: $BUILD_NUMBER"
  echo "Job Name: $JOB_NAME"
  echo "Today: $(date)"
```
- Build Status: SUCCESS

#### Pipeline Project - my-pipeline
- Type: Pipeline
- Stages:
  1. Checkout - Cloning the repository
  2. Build - Building the application
  3. Test - Running tests
  4. Deploy - Deploying the application
- Build Status: SUCCESS

### 5. User Management

#### Users Created
| Username | Role | Access Level |
|----------|------|--------------|
| admin | Administrator | Full Access |
| developer1 | Developer | Limited Access |

- Admin can manage all Jenkins settings
- Developer1 can view and run jobs only

## Architecture## Jenkins URL
http://13.201.59.109:8080

## Author
**Name:** Ashish Nehra  
**GitHub:** nehraashish972-cloud  
**Date:** April 2026

