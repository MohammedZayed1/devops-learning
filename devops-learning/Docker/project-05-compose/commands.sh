#!/bin/bash

# ==========================================
# Docker Project 05 - Docker Compose
# ==========================================

# ------------------------------------------
# 1. Navigate to the Project
# ------------------------------------------

cd docker/project-05-compose


# ------------------------------------------
# 2. Verify Project Structure
# ------------------------------------------

pwd

ls -R


# ------------------------------------------
# 3. Inspect Application Files
# ------------------------------------------

cat web/index.html

cat api/index.html


# ------------------------------------------
# 4. Inspect Compose Configuration
# ------------------------------------------

cat compose.yml


# ------------------------------------------
# 5. Start the Application Stack
# ------------------------------------------

docker compose up -d


# ------------------------------------------
# 6. Check Running Services
# ------------------------------------------

docker compose ps


# ------------------------------------------
# 7. Test the Web Application
# ------------------------------------------

curl http://localhost:8080


# ------------------------------------------
# 8. View All Service Logs
# ------------------------------------------

docker compose logs


# ------------------------------------------
# 9. View Web Service Logs
# ------------------------------------------

docker compose logs web


# ------------------------------------------
# 10. Follow Logs
# ------------------------------------------

docker compose logs -f


# ------------------------------------------
# Press Ctrl+C to stop following logs
# ------------------------------------------


# ------------------------------------------
# 11. Execute Shell Inside Web Service
# ------------------------------------------

docker compose exec web sh


# Commands executed inside the container:
# ls
# cat /usr/share/nginx/html/index.html
# ping api
# exit


# ------------------------------------------
# 12. Test Web → API Communication
# ------------------------------------------

docker compose exec web ping api


# ------------------------------------------
# 13. Inspect Docker Networks
# ------------------------------------------

docker network ls


# ------------------------------------------
# 14. Inspect Compose Network
# ------------------------------------------

docker network inspect inventory-network


# ------------------------------------------
# 15. Stop Compose Services
# ------------------------------------------

docker compose stop


# ------------------------------------------
# 16. Verify Stopped Services
# ------------------------------------------

docker compose ps


# ------------------------------------------
# 17. Start Services Again
# ------------------------------------------

docker compose start


# ------------------------------------------
# 18. Verify Services
# ------------------------------------------

docker compose ps


# ------------------------------------------
# 19. Bring the Application Down
# ------------------------------------------

docker compose down


# ------------------------------------------
# 20. Verify Containers
# ------------------------------------------

docker ps -a


# ------------------------------------------
# 21. Verify Networks
# ------------------------------------------

docker network ls


# ------------------------------------------
# 22. Recreate the Complete Application
# ------------------------------------------

docker compose up -d


# ------------------------------------------
# 23. Verify Recreated Application
# ------------------------------------------

docker compose ps

curl http://localhost:8080


# ------------------------------------------
# 24. Verify Environment Variable
# ------------------------------------------

docker compose exec web env | grep APP_ENV

# ------------------------------------------
# 25. Final Cleanup
# ------------------------------------------

docker compose down


# ------------------------------------------
# 26. Final Verification
# ------------------------------------------

docker ps -a

docker network ls
