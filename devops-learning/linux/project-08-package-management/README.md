# Project 08 - Linux Package Management

# Objective

The objective of this project is to learn how to manage software packages on Ubuntu Linux using the Advanced Package Tool (APT) and Debian Package Manager (DPKG). The project focuses on installing, updating, upgrading, removing, and investigating software packages while understanding package dependencies and system maintenance.

# Scenario

A new Ubuntu server is being prepared for application deployment.

As the DevOps Engineer, the goal is to configure the server by updating the operating system, installing required software, verifying installed packages, investigating package ownership, removing unnecessary software, and cleaning the system to ensure it is ready for production.

# Tasks Completed

- Update package repositories.
- Upgrade installed packages.
- Search for available packages.
- Display package information.
- Install new software packages.
- Verify installed software versions.
- List installed packages.
- Investigate package ownership of files.
- Display files installed by packages.
- Remove installed packages.
- Purge package configuration files.
- Remove unused dependencies.
- Clean the package cache.
- Create an automated package information report.

# Commands Practiced

= Package Management
- `apt update`
- `apt upgrade`
- `apt install`
- `apt remove`
- `apt purge`
- `apt autoremove`
- `apt clean`

= Package Investigation
- `apt search`
- `apt show`
- `apt list --installed`
- `apt list --upgradable`

= Debian Package Manager
- `dpkg -S`
- `dpkg -L`
- `dpkg -l`

= Utility Commands
- `which`
- `wc`
- `lsb_release`
