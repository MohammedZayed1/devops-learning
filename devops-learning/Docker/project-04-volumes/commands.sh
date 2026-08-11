#!/bin/bash

# ==========================================
# Docker Project 04 - Volumes & Data Persistence
# ==========================================

# ------------------------------------------
# 1. List Existing Docker Volumes
# ------------------------------------------

docker volume ls


# ------------------------------------------
# 2. Create Named Volume
# ------------------------------------------

docker volume create inventory-data


# ------------------------------------------
# 3. Inspect the Volume
# ------------------------------------------

docker volume inspect inventory-data


# ------------------------------------------
# 4. Create Container with Named Volume
# ------------------------------------------

docker run -d \
  --name inventory-storage \
  -v inventory-data:/usr/share/nginx/html \
  nginx:alpine


# ------------------------------------------
# 5. Verify Container
# ------------------------------------------

docker ps


# ------------------------------------------
# 6. Create Data Inside the Container
# ------------------------------------------

docker exec inventory-storage sh -c \
'echo "Inventory data created inside the container" > /usr/share/nginx/html/data.txt'


# ------------------------------------------
# 7. Verify Data
# ------------------------------------------

docker exec inventory-storage \
  cat /usr/share/nginx/html/data.txt


# ------------------------------------------
# 8. Stop and Remove Container
# ------------------------------------------

docker stop inventory-storage

docker rm inventory-storage


# ------------------------------------------
# 9. Verify Volume Still Exists
# ------------------------------------------

docker volume ls


# ------------------------------------------
# 10. Create New Container Using Same Volume
# ------------------------------------------

docker run -d \
  --name inventory-storage-new \
  -v inventory-data:/usr/share/nginx/html \
  nginx:alpine


# ------------------------------------------
# 11. Verify Persistent Data
# ------------------------------------------

docker exec inventory-storage-new \
  cat /usr/share/nginx/html/data.txt


# ------------------------------------------
# 12. Test Persistent Data Through Nginx
# ------------------------------------------

docker stop inventory-storage-new

docker rm inventory-storage-new

docker run -d \
  --name inventory-storage \
  -p 8082:80 \
  -v inventory-data:/usr/share/nginx/html \
  nginx:alpine


curl http://localhost:8082/data.txt


# ------------------------------------------
# 13. Create Host Directory for Bind Mount
# ------------------------------------------

mkdir -p app-data


# ------------------------------------------
# 14. Create Host Data
# ------------------------------------------

echo "Data from the host machine" > app-data/host-data.txt


# ------------------------------------------
# 15. Create Container Using Bind Mount
# ------------------------------------------

docker run -d \
  --name inventory-bind \
  -p 8083:80 \
  -v "$(pwd)/app-data:/usr/share/nginx/html" \
  nginx:alpine


# ------------------------------------------
# 16. Test Bind Mount
# ------------------------------------------

curl http://localhost:8083/host-data.txt


# ------------------------------------------
# 17. Modify Data on Host
# ------------------------------------------

echo "Updated from the host" > app-data/host-data.txt


# ------------------------------------------
# 18. Verify Host Changes Inside Container
# ------------------------------------------

curl http://localhost:8083/host-data.txt


# ------------------------------------------
# 19. Inspect Container Mounts
# ------------------------------------------

docker inspect inventory-storage

docker inspect inventory-bind


# ------------------------------------------
# 20. Create Read-Only Volume Mount
# ------------------------------------------

docker run -d \
  --name inventory-readonly \
  -v inventory-data:/usr/share/nginx/html:ro \
  nginx:alpine


# ------------------------------------------
# 21. Test Read-Only Mount
# ------------------------------------------

docker exec inventory-readonly \
  sh -c 'echo "test" > /usr/share/nginx/html/test.txt'


# ------------------------------------------
# 22. Inspect Volume
# ------------------------------------------

docker volume inspect inventory-data


# ------------------------------------------
# 23. Stop Containers
# ------------------------------------------

docker stop inventory-storage inventory-bind inventory-readonly


# ------------------------------------------
# 24. Remove Containers
# ------------------------------------------

docker rm inventory-storage inventory-bind inventory-readonly


# ------------------------------------------
# 25. Verify Volume Still Exists
# ------------------------------------------

docker volume ls


# ------------------------------------------
# 26. Remove Volume
# ------------------------------------------

docker volume rm inventory-data


# ------------------------------------------
# 27. Verify Cleanup
# ------------------------------------------

docker volume ls

docker ps -a
