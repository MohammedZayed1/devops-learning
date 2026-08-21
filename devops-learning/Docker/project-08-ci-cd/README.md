# Project 08 — CI/CD with GitHub Actions and Docker

# Overview
This project demonstrates how to build a basic CI/CD pipeline using **GitHub Actions, Node.js, npm, and Docker**.
The pipeline automatically:

1. Checks out the repository.
2. Sets up Node.js.
3. Installs application dependencies.
4. Runs automated tests.
5. Builds a Docker image if the tests pass.

The project also demonstrates working with **Git feature branches and Pull Requests**.

# Objectives

- Understand the basics of Continuous Integration (CI).
- Create a GitHub Actions workflow.
- Automate Node.js application testing.
- Build a Docker image automatically.
- Use feature branches with Git.
- Use Pull Requests to merge changes into `main`.
- Understand how CI can validate code before merging.
- Practice troubleshooting GitHub Actions workflows.

# CI Pipeline 
The pipeline follows this process:

Developer
    │
    ▼
Feature Branch
    │
    ▼
Git Push
    │
    ▼
GitHub Actions
    │
    ├── Checkout Repository
    │
    ├── Setup Node.js
    │
    ├── Install Dependencies
    │
    ├── Run Tests
    │       │
    │       └── Failure → Stop
    │
    └── Build Docker Image
            │
            ▼
           Success
