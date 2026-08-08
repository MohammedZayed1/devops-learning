# Linux Capstone Project - Production Server Investigation & Automation

# Objective
The objective of this capstone project is to demonstrate practical Linux system administration skills by solving a realistic production-style scenario. The project combines user management, file management, process monitoring, networking, package management, log analysis, and Bash scripting into a single hands-on investigation.

# Skills Demonstrated
- Linux System Administration
- Linux Troubleshooting
- File System Management
- User & Group Management
- Linux Permissions
- Networking
- Process Monitoring
- Package Management
- Log Analysis
- Bash Scripting
- Automation
- Git & GitHub

# Environment
- Operating System: Ubuntu 22.04.5 LTS (WSL2)
- Shell: Bash
- Version Control: Git & GitHub

# Scenario
Welcome to your first day as a Junior DevOps Engineer at GreenTech Solutions.
The Inventory Management application has suddenly become unstable.
Your manager sends you this message:
"Mohammed, the monitoring system has reported several issues with the application server. Before we deploy the next version, I need a complete investigation report. Don't reboot the server unless absolutely necessary."
Your job is to investigate and prepare the server.

The objectives included:

- Gathering system information.
- Configuring application users and permissions.
- Preparing the application directory.
- Managing files and backups.
- Investigating running processes.
- Verifying network connectivity.
- Inspecting installed software.
- Analyzing application logs.
- Automating the entire system audit.

The project simulates a real production maintenance task performed by Linux and DevOps engineers.

# Project Structure
```
linux-capstone
├── logs
│   └── log-sample.log
├── README.md
├── reports
│   ├── logs-report.txt
│   ├── server-analysis.txt
│   └── server-info-report.txt
└── scripts
    ├── logs-analysis.sh
    ├── server-info.sh
    └── system-audit.sh
```

# Tasks Completed

## Server Investigation
- Identified hostname.
- Checked Ubuntu version.
- Verified kernel version.
- Checked uptime.
- Retrieved current user information.
- Collected system date and time.

## User & Permission Management
- Created a new developer account.
- Created a backend group.
- Added users to the application group.
- Configured directory ownership.
- Applied secure Linux permissions.
- Implemented shared group access.
- Configured group inheritance (setgid).

## File Management
- Created application directory structure.
- Created configuration, source code, log, backup, and deployment files.
- Copied configuration files.
- Renamed log files.
- Archived application files.
- Extracted archives.
- Verified extracted contents.

## Process Monitoring
- Simulated a CPU-intensive process.
- Investigated running processes.
- Identified high CPU usage.
- Identified high memory usage.
- Terminated unnecessary processes.

## Networking
- Identified server IP address.
- Verified Internet connectivity.
- Tested DNS resolution.
- Inspected listening ports.
- Identified processes using network ports.

## Package Management
- Verified installed packages.
- Checked Git version.
- Removed unused software.
- Cleaned package cache.

## Log Analysis
- Created sample application logs.
- Filtered INFO, WARNING, and ERROR messages.
- Counted log entries by severity.
- Generated an error report.

## Automation
Created a complete system audit script capable of automatically generating a server health report containing:
- Hostname
- Date
- Uptime
- Current user
- User count
- Memory usage
- Disk usage
- Running processes
- Network information
- Installed software versions
- Log statistics

# Key Learnings
Through this capstone project, I learned how to:

- Investigate Linux servers methodically before making changes.
- Configure secure user and group permissions.
- Organize application files following Linux best practices.
- Monitor system resources and running processes.
- Troubleshoot network connectivity issues.
- Manage Ubuntu software packages.
- Analyze application logs efficiently.
- Automate repetitive administrative tasks using Bash scripting.
- Combine multiple Linux tools to solve real-world operational problems.
