# Project 06 - Multi-Container Inventory Application

# Objective
The objective of this project is to build and containerize a realistic multi-container Inventory Management application.

# Scenario

The Inventory Management application is composed of three services:

1. **Web** - Nginx web server and reverse proxy
2. **API** - Node.js/Express application
3. **Database** - PostgreSQL database

# Application Architecture

```text
                         Host Machine
                              │
                           :8080
                              │
                              ▼
                    ┌─────────────────┐
                    │   inventory-web │
                    │      Nginx      │
                    └────────┬────────┘
                             │
                       /api/ │
                             ▼
                    ┌─────────────────┐
                    │  inventory-api  │
                    │    Node.js      │
                    │    Express      │
                    └────────┬────────┘
                             │
                           :5432
                             │
                             ▼
                    ┌─────────────────┐
                    │  inventory-db   │
                    │   PostgreSQL    │
                    └────────┬────────┘
                             │
                             ▼
                       postgres-data
                          Volume
```

All three services communicate through:

```text
inventory-network
```

# Services

## 1. Web Service

The web service uses:

```text
nginx:alpine
```

Its responsibilities are:

- Serve the Inventory Management web page.
- Receive requests from the browser.
- Forward API requests to the Node.js service.

The service is exposed through:

```text
localhost:8080
```

The port mapping is:

```text
8080:80
```

## 2. API Service

The API service is built using:

```text
Node.js
Express.js
```

The API runs internally on:

```text
3000
```

It provides the following endpoints:

```text
GET /
GET /health
GET /db-test
```

### `/`

Returns information about the API service.

Example:

```json
{
  "service": "inventory-api",
  "status": "running"
}
```

### `/health`

Used by Docker as a health check.

Example:

```json
{
  "status": "healthy"
}
```

### `/db-test`

Tests communication between the Node.js API and PostgreSQL database.

## 3. Database Service

The database service uses:

```text
postgres:16-alpine
```

The PostgreSQL database is configured with:

```text
Database: inventory
User: inventory
```

The database uses a persistent Docker volume:

```text
postgres-data
```

# Dockerfiles

Two custom Docker images were created.

## API Dockerfile

The API Dockerfile:

```text
api/Dockerfile
```

uses:

```dockerfile
FROM node:20-alpine
```

The image:

1. Uses Node.js Alpine.
2. Sets `/app` as the working directory.
3. Copies `package.json`.
4. Installs dependencies.
5. Copies the application.
6. Exposes port `3000`.
7. Starts the API using `npm start`.

## Web Dockerfile

The web Dockerfile:

```text
web/Dockerfile
```

uses:

```dockerfile
FROM nginx:alpine
```

It copies:

```text
index.html
```

into the Nginx web directory and replaces the default Nginx configuration with the project's custom configuration.

# Docker Networking

All three services are connected to:

```text
inventory-network
```

The network uses the:

```text
bridge
```

driver.

The architecture is:

```text
┌─────────────────────────────────────────┐
│          inventory-network              │
│                                         │
│  inventory-web                          │
│        │                                │
│        ▼                                │
│  inventory-api                          │
│        │                                │
│        ▼                                │
│  inventory-db                           │
│                                         │
└─────────────────────────────────────────┘
```

# Service Discovery

The API connects to PostgreSQL using:

```text
db:5432
```

instead of using an IP address.

The database service is named:

```text
db
```

Docker's internal DNS resolves:

```text
db
```

to the PostgreSQL container.
This makes the application independent of dynamically assigned container IP addresses.

# Service Dependencies

The services have the following dependency chain:

```text
PostgreSQL
     │
     │ healthy
     ▼
Node.js API
     │
     │ healthy
     ▼
Nginx Web
```

The Compose configuration uses:

```yaml
depends_on:
```

with:

```yaml
condition: service_healthy
```

This ensures that dependent services wait for their required services to become healthy.





