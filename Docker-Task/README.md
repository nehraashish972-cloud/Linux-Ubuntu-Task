# Docker on AWS EC2

## Instance Details:
- AMI: Ubuntu 24.04 LTS
- Instance Type: t3.micro
- Region: ap-south-1 (Mumbai)
- Docker Version: 29.3.1

## Docker Commands Explored:

### 1. Images
- docker pull ubuntu/nginx/alpine
- docker images
- docker inspect
- docker rmi

### 2. Containers
- docker run hello-world
- docker run -d --name my-nginx -p 80:80 nginx
- docker ps / docker ps -a
- docker exec -it my-nginx bash
- docker stop / docker rm

### 3. Volumes
- docker volume create myvolume
- docker volume ls
- docker volume inspect myvolume
- Data persistence proved between vol-test and vol-test2

### 4. Networks
- docker network create mynetwork
- docker network ls
- docker network inspect mynetwork
- container1 ping container2 = 0% packet loss
- docker network rm mynetwork

## Screenshots:
See screenshots folder
