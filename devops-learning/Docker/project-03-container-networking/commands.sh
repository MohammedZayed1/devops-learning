#!/bin/bash

# ==========================================
# Docker Project 03 - Container Networking
# ==========================================

# ------------------------------------------
# 1. List Docker Networks
# ------------------------------------------

docker network ls


# ------------------------------------------
# 2. Inspect Default Bridge Network
# ------------------------------------------

docker network inspect bridge


# ------------------------------------------
# 3. Create Custom Network
# ------------------------------------------

docker network create inventory-network


# ------------------------------------------
# 4. Verify Custom Network
# ------------------------------------------

docker network ls

docker network inspect inventory-network


# ------------------------------------------
# 5. Create Web Container
# ------------------------------------------

docker run -d \
  --name inventory-web \
  --network inventory-network \
  nginx:alpine


# ------------------------------------------
# 6. Create API Container
# ------------------------------------------

docker run -d \
  --name inventory-api \
  --network inventory-network \
  nginx:alpine


# ------------------------------------------
# 7. Verify Containers
# ------------------------------------------

docker ps


# ------------------------------------------
# 8. Test Container-to-Container Communication
# ------------------------------------------

docker exec -it inventory-web sh

# Inside inventory-web:
# ping inventory-api

# Exit:
# exit


# ------------------------------------------
# 9. Test Communication in Reverse Direction
# ------------------------------------------

docker exec -it inventory-api sh

# Inside inventory-api:
# ping inventory-web

# Exit:
# exit


# ------------------------------------------
# 10. Inspect Network Configuration
# ------------------------------------------

docker network inspect inventory-network

docker inspect inventory-web

docker inspect inventory-api


# ------------------------------------------
# 11. Create Container Outside Custom Network
# ------------------------------------------

docker run -d \
  --name isolated-nginx \
  nginx:alpine


# ------------------------------------------
# 12. Test Network Isolation
# ------------------------------------------

docker exec inventory-web ping isolated-nginx


# ------------------------------------------
# 13. Connect Existing Container to Network
# ------------------------------------------

docker network connect inventory-network isolated-nginx


# ------------------------------------------
# 14. Verify Network Membership
# ------------------------------------------

docker network inspect inventory-network


# ------------------------------------------
# 15. Test Communication After Connecting
# ------------------------------------------

docker exec inventory-web ping isolated-nginx


# ------------------------------------------
# 16. Disconnect Container
# ------------------------------------------

docker network disconnect inventory-network isolated-nginx


# ------------------------------------------
# 17. Verify Disconnection
# ------------------------------------------

docker network inspect inventory-network


# ------------------------------------------
# 18. Stop Containers
# ------------------------------------------

docker stop inventory-web inventory-api isolated-nginx


# ------------------------------------------
# 19. Remove Containers
# ------------------------------------------

docker rm inventory-web inventory-api isolated-nginx


# ------------------------------------------
# 20. Remove Custom Network
# ------------------------------------------

docker network rm inventory-network


# ------------------------------------------
# 21. Verify Cleanup
# ------------------------------------------

docker network ls

docker ps -a
