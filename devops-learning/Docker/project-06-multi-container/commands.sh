#!/bin/bash

# ==========================================
# Docker Project 06
# Multi-Container Inventory Application
# ==========================================


# ==========================================
# 1. Project Setup
# ==========================================

mkdir -p docker/project-06-multi-container

cd docker/project-06-multi-container

pwd

ls -R


# ==========================================
# 2. Inspect Project Files
# ==========================================

cat compose.yml

cat api/Dockerfile

cat api/package.json

cat api/server.js

cat web/Dockerfile

cat web/nginx.conf

cat web/index.html


# ==========================================
# 3. Validate Docker Compose Configuration
# ==========================================

docker compose config


# ==========================================
# 4. Build Application Images
# ==========================================

docker compose build


# ==========================================
# 5. List Docker Images
# ==========================================

docker images


# ==========================================
# 6. Start Application
# ==========================================

docker compose up -d


# ==========================================
# 7. Check Running Services
# ==========================================

docker compose ps


# ==========================================
# 8. Check Compose Images
# ==========================================

docker compose images


# ==========================================
# 9. View All Logs
# ==========================================

docker compose logs


# ==========================================
# 10. View API Logs
# ==========================================

docker compose logs api


# ==========================================
# 11. View Database Logs
# ==========================================

docker compose logs db


# ==========================================
# 12. Follow Logs
# ==========================================

docker compose logs -f

# Press Ctrl+C to stop following logs.


# ==========================================
# 13. Test Web Application
# ==========================================

curl http://localhost:8080


# ==========================================
# 14. Test API
# ==========================================

curl http://localhost:8080/api/


# ==========================================
# 15. Test API Health
# ==========================================

curl http://localhost:8080/api/health


# ==========================================
# 16. Test Database Connectivity
# ==========================================

curl http://localhost:8080/api/db-test


# ==========================================
# 17. Execute Shell in Web Container
# ==========================================

docker compose exec web sh

# Inside the container:
#
# ls
# cat /usr/share/nginx/html/index.html
# ping api
# exit


# ==========================================
# 18. Execute Shell in API Container
# ==========================================

docker compose exec api sh

# Inside the container:
#
# pwd
# ls
# ping localhost:3000/health
# exit


# ==========================================
# 19. Check API Environment Variables
# ==========================================

docker compose exec api env


# ==========================================
# Check Specific Database Configuration
# ==========================================

docker compose exec api env | grep DB_


# ==========================================
# 20. Access PostgreSQL
# ==========================================

docker compose exec db psql -U inventory -d inventory

# Inside PostgreSQL:
#
# SELECT NOW();
# \q


# ==========================================
# 21. Inspect Docker Networks
# ==========================================

docker network ls


# ==========================================
# 22. Inspect Application Network
# ==========================================

docker network inspect inventory-network


# ==========================================
# 23. Inspect Docker Volumes
# ==========================================

docker volume ls


# ==========================================
# 24. Inspect PostgreSQL Volume
# ==========================================

docker volume inspect project-06-multi-container_postgres-data

# Note:
# The exact volume name may differ depending
# on the Compose project name.


# ==========================================
# 25. Inspect Running Containers
# ==========================================

docker ps


# ==========================================
# 26. Inspect Web Container
# ==========================================

docker inspect inventory-web


# ==========================================
# 27. Inspect API Container
# ==========================================

docker inspect inventory-api


# ==========================================
# 28. Inspect Database Container
# ==========================================

docker inspect inventory-db


# ==========================================
# 29. Stop Application
# ==========================================

docker compose stop


# ==========================================
# 30. Verify Stopped Services
# ==========================================

docker compose ps


# ==========================================
# 31. Start Application Again
# ==========================================

docker compose start


# ==========================================
# 32. Verify Services
# ==========================================

docker compose ps


# ==========================================
# 33. Persistence Test
# ==========================================

docker compose down


# Start again:

docker compose up -d


# Test database connectivity again:

curl http://localhost:8080/api/db-test


# ==========================================
# 34. Final Verification
# ==========================================

docker compose ps

docker compose images

docker network ls

docker volume ls


# ==========================================
# 35. Final Cleanup
# ==========================================

# WARNING:
# This removes containers and the network,
# but keeps the PostgreSQL volume.

docker compose down


# ==========================================
# 36. Destructive Cleanup - OPTIONAL
# ==========================================

# WARNING:
# Do NOT run this if you want to preserve
# PostgreSQL data.

# docker compose down -v
