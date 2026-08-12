#!/bin/bash

# ==========================================
# Docker Project 07
# Docker Image Optimization & Security
# ==========================================


# ==========================================
# 1. Navigate to Project
# ==========================================

cd ~/DevOps_Projects/devops-learning/Docker/project-07-image-optimization

pwd


# ==========================================
# 2. Inspect Project Structure
# ==========================================

ls -R


# ==========================================
# 3. Inspect API Files
# ==========================================

ls -la api

cat api/package.json

cat api/server.js

cat api/Dockerfile

cat api/Dockerfile.optimized

cat api/.dockerignore


# ==========================================
# 4. Generate package-lock.json
# ==========================================

cd api

npm install

cd ..


# ==========================================
# 5. Verify Lock File
# ==========================================

ls -la api

# Expected:
# package.json
# package-lock.json


# ==========================================
# 6. Build Original Image
# ==========================================

docker build \
  -t inventory-api:original \
  ./api


# ==========================================
# 7. List Original Image
# ==========================================

docker images inventory-api


# ==========================================
# 8. Inspect Original Image History
# ==========================================

docker history inventory-api:original


# ==========================================
# 9. Inspect Original Image
# ==========================================

docker image inspect inventory-api:original


# ==========================================
# 10. Rebuild Original Image
# ==========================================

docker build \
  -t inventory-api:original \
  ./api

# Observe Docker layer caching.


# ==========================================
# 11. Build Optimized Image
# ==========================================

docker build \
  -t inventory-api:optimized \
  -f api/Dockerfile.optimized \
  api


# ==========================================
# 12. Compare Images
# ==========================================

docker images inventory-api


# ==========================================
# 13. Inspect Optimized Image History
# ==========================================

docker history inventory-api:optimized


# ==========================================
# 14. Inspect Optimized Image
# ==========================================

docker image inspect inventory-api:optimized


# ==========================================
# 15. Run Optimized Container
# ==========================================

docker run -d \
  --name inventory-api-optimized \
  -p 3001:3000 \
  inventory-api:optimized


# ==========================================
# 16. Check Running Container
# ==========================================

docker ps


# ==========================================
# 17. Check Container Logs
# ==========================================

docker logs inventory-api-optimized


# ==========================================
# 18. Test API
# ==========================================

curl http://localhost:3001


# ==========================================
# 19. Test Health Endpoint
# ==========================================

curl http://localhost:3001/health


# ==========================================
# 20. Verify Running User
# ==========================================

docker exec inventory-api-optimized whoami

# Expected:
# node


# ==========================================
# 21. Verify User Details
# ==========================================

docker exec inventory-api-optimized id


# ==========================================
# 22. Inspect Container
# ==========================================

docker inspect inventory-api-optimized


# ==========================================
# 23. Open Shell in Container
# ==========================================

docker exec -it inventory-api-optimized sh

# Inside the container:
#
# whoami
# pwd
# ls -la
#
# Try:
# touch /test.txt
#
# Expected:
# Permission denied
#
# Exit:
# exit


# ==========================================
# 24. Compare Image Sizes
# ==========================================

docker images inventory-api


# Record actual sizes in notes.md:
#
# Original:
# __________________
#
# Optimized:
# __________________
#
# Difference:
# __________________


# ==========================================
# 25. Compare Image Layers
# ==========================================

docker history inventory-api:original

docker history inventory-api:optimized


# ==========================================
# 26. Optional Build Timing
# ==========================================

time docker build \
  -t inventory-api:test-original \
  ./api

time docker build \
  -t inventory-api:test-optimized \
  -f api/Dockerfile.optimized \
  api


# ==========================================
# 27. Verify Docker Images
# ==========================================

docker images inventory-api


# ==========================================
# 28. Stop Optimized Container
# ==========================================

docker stop inventory-api-optimized


# ==========================================
# 29. Remove Optimized Container
# ==========================================

docker rm inventory-api-optimized


# ==========================================
# 30. Optional Cleanup of Test Images
# ==========================================

# WARNING:
# Only run these if the test images are no
# longer needed.

# docker image rm inventory-api:test-original

# docker image rm inventory-api:test-optimized


# ==========================================
# 31. Final Verification
# ==========================================

docker images inventory-api

docker ps -a
