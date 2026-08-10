#!/bin/bash

# ==========================================
# Docker Project 02 - Images & Dockerfiles
# ==========================================

# ------------------------------------------
# 1. Navigate to the project
# ------------------------------------------

cd docker/project-02-dockerfile


# ------------------------------------------
# 2. Verify project files
# ------------------------------------------

pwd
ls
ls -R


# ------------------------------------------
# 3. Create and inspect the application
# ------------------------------------------

cat app/index.html


# ------------------------------------------
# 4. Inspect the Dockerfile
# ------------------------------------------

cat Dockerfile


# ------------------------------------------
# 5. Build the first Docker image
# ------------------------------------------

docker build -t inventory-web:v1 .


# ------------------------------------------
# 6. List Docker images
# ------------------------------------------

docker images


# ------------------------------------------
# 7. Run the application container
# ------------------------------------------

docker run -d --name inventory-web -p 8080:80 inventory-web:v1


# ------------------------------------------
# 8. Verify the running container
# ------------------------------------------

docker ps


# ------------------------------------------
# 9. Test the application
# ------------------------------------------

curl http://localhost:8080


# ------------------------------------------
# 10. Inspect the container
# ------------------------------------------

docker inspect inventory-web


# ------------------------------------------
# 11. Check the HTML file inside the container
# ------------------------------------------

docker exec inventory-web cat /usr/share/nginx/html/index.html


# ------------------------------------------
# 12. View image layers
# ------------------------------------------

docker history inventory-web:v1


# ------------------------------------------
# 13. Modify the application
# ------------------------------------------

# Edit the application:
# vim app/index.html


# ------------------------------------------
# 14. Build the second image version
# ------------------------------------------

docker build -t inventory-web:v2 .


# ------------------------------------------
# 15. Verify image versions
# ------------------------------------------

docker images


# ------------------------------------------
# 16. Stop the old container
# ------------------------------------------

docker stop inventory-web


# ------------------------------------------
# 17. Remove the old container
# ------------------------------------------

docker rm inventory-web


# ------------------------------------------
# 18. Run the new image version
# ------------------------------------------

docker run -d --name inventory-web -p 8080:80 inventory-web:v2


# ------------------------------------------
# 19. Verify the new container
# ------------------------------------------

docker ps


# ------------------------------------------
# 20. Test the updated application
# ------------------------------------------

curl http://localhost:8080


# ------------------------------------------
# 21. Verify the updated HTML inside container
# ------------------------------------------

docker exec inventory-web cat /usr/share/nginx/html/index.html


# ------------------------------------------
# 22. Rebuild without cache
# ------------------------------------------

# Used during troubleshooting to ensure
# Docker rebuilt all image layers.

docker build --no-cache -t inventory-web:v1 .
