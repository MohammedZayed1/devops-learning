# Project 05 - Linux Networking

# Objective
The objective of this project is to develop practical Linux networking skills by investigating network connectivity, DNS resolution, open ports, and HTTP communication. The project simulates the responsibilities of a DevOps Engineer troubleshooting network-related issues on a production server.

# Scenario
An application hosted on a Linux server becomes unreachable, and users report connection issues.
As the on-call DevOps Engineer, the goal is to investigate the problem by answering questions such as:

- Is the server reachable?
- Is DNS working correctly?
- Is the application responding?
- Which ports are open?
- Which process is listening on a specific port?

The investigation is performed using standard Linux networking tools without restarting the server.

# Task
- Identify the server hostname and IP address.
- Inspect network interfaces.
- Test Internet connectivity.
- Verify DNS resolution.
- Send HTTP requests using `curl`.
- Download files using `wget`.
- Examine listening network ports.
- Identify processes associated with network ports.
- Perform DNS lookups using `nslookup` and `dig`.
- Trace network paths using `traceroute`.
- Review SSH public key configuration.
- Creat a simple network health report.

# Commands

= Network Information
- `hostname`
- `hostname -I`
- `ip addr`

= Connectivity Testing
- `ping`

= HTTP Requests
- `curl`
- `wget`

= Network Monitoring
- `ss`
- `lsof`

= DNS Tools
- `nslookup`
- `dig`

= Network Diagnostics
- `traceroute`

= SSH
- `ssh-keygen`
- `cat ~/.ssh/id_ed25519.pub`
