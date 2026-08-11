# Project 04 - Docker Volumes & Data Persistence

# Scenario
The Inventory Management application needs persistent storage.
Application data should not be lost when a container is stopped, removed, or recreated.

The task was to investigate Docker's storage mechanisms and implement persistent storage using:
- Docker named volumes
- Bind mounts
- Read-only mounts

# Objective

The objective of this project is to understand how Docker handles persistent data and how volumes and bind mounts can be used to preserve application data independently of container lifecycles.

# Tasks
1. Inspect Existing Volumes
2. Create a Named Volume
3. Mounte a Volume to a Container
4. Create Data Inside the Container

# Docker Volumes
A Docker volume provides storage that exists independently from the lifecycle of a particular container.

The project used a named volume:
```text
inventory-data
```

The volume was mounted inside the container at:
```text
/usr/share/nginx/html
```

The storage architecture was:

```text
Docker Volume
inventory-data
       │
       │ mounted to
       ▼
/usr/share/nginx/html
       │
       ▼
Nginx Container
```
