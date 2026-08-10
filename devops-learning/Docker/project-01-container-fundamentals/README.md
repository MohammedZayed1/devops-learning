# Project 01 - Docker Container Fundamentals

# Objective

The objective of this project is to understand the fundamentals of Docker and learn how to create, run, inspect, manage, and remove Docker containers.

# Scenario

The development team wants to start using containers to ensure that applications run consistently across different environments.
As a Junior DevOps Engineer, the first task is to understand the Docker environment and learn how to manage application containers.

# Docker Concepts

## Docker Image
A Docker image is a read-only template used to create containers.

For example:

```text
nginx image
     │
     │ docker run
     ▼
Docker container
```

## Docker Container
A container is a running instance created from a Docker image.
One image can be used to create multiple containers:

```text
             nginx image
                  │
        ┌─────────┼─────────┐
        ▼         ▼         ▼
   container 1  container 2  container 3
```

## Docker CLI
The Docker CLI allows users to communicate with the Docker daemon and manage Docker resources.

## Docker Daemon
The Docker daemon is the background service responsible for managing Docker images, containers, networks, and other Docker resources.

## Docker Container Lifecycle
The basic lifecycle practiced in this project can be represented as:

```text
             Docker Image
                  │
                  │ docker run
                  ▼
             Container
                  │
          ┌───────┴───────┐
          │               │
      Running          Stopped
          │               │
     docker stop     docker start
          │
          ▼
     docker rm
```
An image can also be used to create multiple independent containers.

# Tasks
- Verify the Docker installation.
- Verify communication with the Docker daemon.
- Ran the `hello-world` container.
- Download and ran the Nginx image.
- List running containers.
- List all containers.
- Run containers in detached mode.
- Assigne custom names to containers.
- Inspect container configuration.
- View container logs.
- Execute commands inside a running container.
- Inspect files inside the Nginx container.
- Create multiple containers from the same image.
- Stop containers.
- Remove containers.
- Remove Docker images.
