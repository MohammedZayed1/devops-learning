# Project 04 - Linux System Monitoring & Process Management

# Objective

Learing how to monitor Linux systems, analyze resource utilization, investigate running processes, and troubleshoot common performance issues. The project simulates the daily responsibilities of a DevOps Engineer responsible for maintaining healthy production servers.

# Scenario
A production application has become slow, and developers have reported performance issues. As a Junior DevOps Engineer, the objective is to investigate the server without rebooting it and identify possible causes using Linux monitoring and process management tools.


# Tasks
- Gather general system information.
- Check server uptime and logged-in users.
- Monitor CPU and memory utilization.
- Investigate running processes.
- Simulate a high CPU usage process.
- Terminate processes safely using Linux signals.
- Analyze memory usage.
- Monitor disk usage.
- Inspect active network connections.
- Identify processes using network ports.
- Attempt to inspect system logs.
- Generate a simple system health report.

# Commands

= System Information
- `hostname`
- `uname -a`
- `uptime`
- `who`
- `date`

= Resource Monitoring
- `top`
- `htop`
- `free`
- `vmstat`

= Process Management
- `ps aux`
- `grep`
- `pgrep`
- `kill`

= Disk Monitoring
- `df -h`
- `du -sh`
- `du -h`
- `sort`

= Network Monitoring
- `ss`
- `lsof`

= Logs
- `journalctl`
