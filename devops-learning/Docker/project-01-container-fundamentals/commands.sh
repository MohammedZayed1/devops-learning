#!/bin/bash

# ==========================================
# Docker Project 01 - Container Fundamentals
# ==========================================

# ------------------------------------------
# 1. Verify Docker Installation
# ------------------------------------------

docker --version

docker info

docker run hello-world


# ------------------------------------------
# 2. Run Nginx Container
# ------------------------------------------

docker run nginx


# ------------------------------------------
# 3. List Containers
# ------------------------------------------

# Show currently running containers
docker ps

# Show all containers, including stopped ones
docker ps -a


# ------------------------------------------
# 4. Run Container in Detached Mode
# ------------------------------------------

docker run -d nginx


# ------------------------------------------
# 5. Create a Named Container
# ------------------------------------------

docker run -d --name inventory-nginx nginx

docker ps


# ------------------------------------------
# 6. Inspect Container
# ------------------------------------------

docker inspect inventory-nginx


# ------------------------------------------
# 7. View Container Logs
# ------------------------------------------

docker logs inventory-nginx

# Follow container logs in real time
docker logs -f inventory-nginx


# ------------------------------------------
# 8. Execute Commands Inside Container
# ------------------------------------------

docker exec -it inventory-nginx bash

# Commands executed inside the container:
# ls
# pwd
# cat /etc/os-release
# ls /usr/share/nginx/html

# Exit the container shell:
# exit


# ------------------------------------------
# 9. View Docker Images
# ------------------------------------------

docker images


# ------------------------------------------
# 10. Run Multiple Containers
# ------------------------------------------

docker run -d --name nginx-1 nginx

docker run -d --name nginx-2 nginx

docker ps


# ------------------------------------------
# 11. Stop Containers
# ------------------------------------------

docker stop nginx-1 nginx-2

docker ps -a


# ------------------------------------------
# 12. Remove Containers
# ------------------------------------------

docker rm nginx-1 nginx-2

docker ps -a


# ------------------------------------------
# 13. Remove Docker Image
# ------------------------------------------

docker rmi nginx

docker images
