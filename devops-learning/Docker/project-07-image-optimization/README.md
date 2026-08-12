# Project 07 - Docker Image Optimization & Security

# Scenario
The Inventory API from the previous project was containerized using a basic Dockerfile.
The goal of this project was to improve the image and container configuration before considering the application production-ready.

The original approach was:
```text
Node.js Application
       │
       ▼
Basic Dockerfile
       │
       ▼
Docker Image
```
The optimized approach is:
```text
Source Code
     │
     ▼
Builder Stage
     │
     ├── Install dependencies
     └── Prepare application
     │
     ▼
Production Stage
     │
     ├── Copy required files
     ├── Use non-root user
     └── Run application
     │
     ▼
Optimized Docker Image
```

# Objective
The objective of this project is to improve a Dockerized Node.js application by applying Docker image optimization and container security best practices.

# Original Dockerfile
The original Dockerfile uses:

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY server.js .

EXPOSE 3000

CMD ["npm", "start"]
```

The image was built with:

```bash
docker build -t inventory-api:original ./api
```

This image was used as the baseline for comparison.

---

# Optimized Dockerfile
The optimized Dockerfile uses a multi-stage build:

```dockerfile
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY server.js .


FROM node:20-alpine AS production

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js .

USER node

EXPOSE 3000

CMD ["node", "server.js"]
```

The image was built with:

```bash
docker build \
  -t inventory-api:optimized \
  -f api/Dockerfile.optimized \
  api
```

# Multi-Stage Build
The optimized Dockerfile contains two stages.

## Builder Stage

```dockerfile
FROM node:20-alpine AS builder
```

The builder stage:

1. Creates the working directory.
2. Copies the package files.
3. Installs dependencies using `npm ci`.
4. Copies the application source code.

```text
Builder
   │
   ├── package.json
   ├── package-lock.json
   ├── npm ci
   └── server.js
```

## Production Stage
The production stage starts from a fresh Node.js image:

```dockerfile
FROM node:20-alpine AS production
```

Only the required application files are copied from the builder:

```dockerfile
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js .
```

This separates the build process from the final runtime environment.

# Docker Layer Caching
Docker builds images in layers.
The Dockerfile was intentionally structured so that dependency installation occurs before application source code is copied:

```dockerfile
COPY package*.json ./

RUN npm ci

COPY server.js .
```

This allows Docker to reuse the dependency installation layer when only the application source changes.

# 🔐 Running as a Non-Root User

The optimized image uses:

```dockerfile
USER node
```

The official Node.js Alpine image already provides a non-root `node` user.

The container was verified using:

```bash
docker exec inventory-api-optimized whoami
```

Expected result:

```text
node
```

rather than:

```text
root
```

This follows the principle of least privilege.
The application does not need root privileges to run Node.js.

# Why Non-Root Containers Matter

Running an application as root gives the application process unnecessary privileges.

The optimized configuration uses:

```text
Container
    │
    ▼
node user
    │
    ▼
Node.js application
```

instead of:

```text
Container
    │
    ▼
root
    │
    ▼
Node.js application
```
Reducing privileges helps limit the potential impact of a security vulnerability.

