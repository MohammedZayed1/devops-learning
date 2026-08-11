# Project 03 - Docker Container Networking

# Objective
The objective of this project is to understand how Docker containers communicate with each other and how Docker provides network isolation and service discovery.

In this project, I created a custom Docker network, connected multiple containers to it, tested container-to-container communication using container names, explored network isolation, and compared internal container networking with host port publishing.

# Scenario
The Inventory Management application is growing.
The team wants to separate the application into two services:

```text
inventory-web
inventory-api
```

The objective is to allow these services to communicate securely through a private Docker network without relying on hard-coded container IP addresses.

# Tasks
1. Inspect Docker Networks
2. Inspect the Default Bridge Network
3. Create a Custom Network
4. Create Containers on the Custom Network

# Docker Networking

Docker provides networking capabilities that allow containers to communicate with:

- Other containers
- The Docker host
- External networks

In this project, a user-defined bridge network was created:

```text
inventory-network
```
The containers connected to this network were able to communicate using their container names.

# Network Architecture

The project used the following architecture:

```text
                inventory-network
        ┌────────────────────────────┐
        │                            │
        │   ┌──────────────┐         │
        │   │ inventory-web│         │
        │   │    Nginx     │         │
        │   └──────┬───────┘         │
        │          │                 │
        │          │ HTTP            │
        │          ▼                 │
        │   ┌──────────────┐         │
        │   │ inventory-api│         │
        │   │    Nginx     │         │
        │   └──────────────┘         │
        │                            │
        └────────────────────────────┘
```

# Docker DNS / Service Discovery
One of the key concepts demonstrated in this project is that containers connected to the same user-defined network can communicate using container names.

# Port Publishing vs Container Networking

A key distinction learned in this project was the difference between **port publishing** and **container-to-container networking**.

### Port Publishing

Example:

```text
-p 8080:80
```

This maps:

```text
Host Port 8080
      │
      ▼
Container Port 80
```

It is useful when an application needs to be accessed from outside the Docker network.

### Container Networking

Containers on the same Docker network can communicate directly:

```text
inventory-web
      │
      │ HTTP
      ▼
inventory-api:80
```
No host port publishing is required for this internal communication.













