# Project 02 - Docker Images & Dockerfiles

# Objective
The objective of this project is to learn how to create custom Docker images using Dockerfiles and use those images to run containerized applications.
In this project, I created a simple Inventory Management web application, built a custom Docker image using Nginx, ran the application inside a container, exposed it through a host port, and created multiple versions of the image.

# Scenario
The development team provided a simple web application and requested a Docker image so that the application could run consistently across different environments.
As a Junior DevOps Engineer, the task was to:

1. Create the application.
2. Define the container environment using a Dockerfile.
3. Build a custom Docker image.
4. Run the application inside a container.
5. Expose the application through a host port.
6. Test the running application.
7. Create a new image version after modifying the application.

# Dockerfile
The Dockerfile used in this project:

```dockerfile
FROM nginx:alpine

COPY app/index.html /usr/share/nginx/html/index.html
```

### `FROM`
```dockerfile
FROM nginx:alpine
```

Defines the base image used to build the custom image.
The project uses the lightweight Alpine-based Nginx image.

### `COPY`
```dockerfile
COPY app/index.html /usr/share/nginx/html/index.html
```

Copies the application's HTML file from the Docker build context into the Nginx web server directory inside the image.


# Building the Docker Image
The custom image was built using:
```bash
docker build -t inventory-web:v1 .
```

The image was tagged as:

```text
inventory-web:v1
```

Where:

- `inventory-web` = image name
- `v1` = image tag/version
- `.` = current directory as the build context

# Running the Container
The application was started using:

```bash
docker run -d --name inventory-web -p 8080:80 inventory-web:v1
```

The port mapping:

```text
Host             Container
8080  ─────────> 80
                  │
                  ▼
                Nginx
                  │
                  ▼
             index.html
```

This allowed the application to be accessed through:

```text
http://localhost:8080
```

# Testing the Application

The running container was verified using:

```bash
docker ps
```

The HTML file inside the container was inspected using:

```bash
docker exec inventory-web cat /usr/share/nginx/html/index.html
```

The application was also tested using:

```bash
curl http://localhost:8080
```

The expected result was the Inventory Management System HTML page.

# Image Versioning

After modifying the application, a second version of the image was created:

```bash
docker build -t inventory-web:v2 .
```

This demonstrated that Docker images can be versioned using tags.

The resulting images included:

```text
inventory-web:v1
inventory-web:v2
```

Each version represents a different build of the application.

---

# Docker Build & Deployment Flow

The workflow used in this project can be represented as:

```text
Application Source Code
        │
        ▼
    Dockerfile
        │
        │ docker build
        ▼
   Docker Image
        │
        │ docker run
        ▼
 Docker Container
        │
        │ Port Mapping
        ▼
     Nginx
        │
        ▼
   Web Application
```
