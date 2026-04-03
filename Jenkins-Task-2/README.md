# Jenkins Task 2 - Auto Build with GitHub Webhook

## Objective
Create a script file, push to GitHub, connect Jenkins to GitHub repo,
and auto-trigger build on every commit with email notification.

## Tech Stack
- AWS EC2 (t3.micro, Ubuntu 22.04)
- GitHub
- Jenkins 2.541.3
- Java 17

## Steps Performed

### 1. Script File Created
- Created `hello_jenkins.sh` shell script
- Pushed to GitHub repo

### 2. Jenkins Configuration
- Installed GitHub plugin
- Configured SMTP email notification
- Created Freestyle job connected to GitHub repo
- Configured GitHub Webhook for auto trigger

### 3. Auto Build Trigger
- GitHub Webhook configured at repo settings
- Every commit to main branch triggers Jenkins build automatically

### 4. Email Notification
- Jenkins sends build result email after every build
- Email contains build status, number, and logs

## How it Works
Developer pushes code to GitHub
↓
GitHub Webhook fires to Jenkins
↓
Jenkins auto triggers build
↓
Script executes on EC2
↓
Email notification sent
## Author
Ashish Nehra
GitHub: nehraashish972-cloud
Date: April 2026
