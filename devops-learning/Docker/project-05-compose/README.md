# Project 05 - Docker Compose

# Scenario
The Inventory Management application is being developed as a multi-service application.
Instead of manually creating and configuring each container, the development team wants the entire environment to be defined in a single Compose configuration.

The application consists of:

```text
Web Service
    │
    ▼
API Service
```

Both services run as separate Docker containers and communicate through a Docker network managed by Compose.

# Objective
The objective of this project is to learn how to use Docker Compose to define, configure, and manage a multi-container application.

# Application Architecture
The application consists of two services:

```text
                    Host Machine
                         │
                    Port 8080
                         │
                         ▼
              ┌───────────────────┐
              │   inventory-web   │
              │      Nginx        │
              └─────────┬─────────┘
                        │
                  Docker Network
                        │
                        ▼
              ┌───────────────────┐
              │   inventory-api   │
              │      Nginx        │
              └───────────────────┘
```

The `web` service is exposed to the host through port `8080`.
The `api` service is accessible internally through the Docker network.

# Docker Compose Configuration
The main configuration file is:

```text
compose.yml
```

The file defines the application services, networking, volumes, ports, and service dependencies.
The main services are:

```yaml
services:
  web:
  api:
```

# Web Service

The web service uses:

```yaml
image: nginx:alpine
```

The container is named:

```text
inventory-web
```

The service exposes:

```yaml
ports:
  - "8080:80"
```

This creates the following mapping:

```text
Host Port 8080
      │
      ▼
Container Port 80
      │
      ▼
Nginx
```

The application can therefore be accessed through:

```text
http://localhost:8080
```

# API Service

The API service also uses:

```yaml
image: nginx:alpine
```

Its container is named:

```text
inventory-api
```

Unlike the web service, the API does not need a published host port because it is accessed internally by the other service.

# Docker Compose Networking

Docker Compose automatically creates a network for the application.

In this project, the network was explicitly named:

```text
inventory-network
```

Both services are connected to this network:

```text
inventory-web
       │
       │ Docker Network
       ▼
inventory-api
```


