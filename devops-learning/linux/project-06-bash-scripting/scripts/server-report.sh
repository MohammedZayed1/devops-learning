#!/bin/bash 

echo "=============================="
echo "Server Helth Reprot"
echo "=============================="
echo 

echo "Current Date:"
date
echo

echo "Hostname:"
hostname
echo

echo "IP address:"
hostname -I
echo 

echo "Current logged-in user:"
whoami
echo

echo "Uptime:"
uptime
echo

echo "Kernel version:"
uname -r
echo

echo "Available disk space on /:"
df -h /
echo

echo "Top memory-consuming process:"
ps aux --sort=-%mem | head -2 
echo  

echo "Memory Usage:" 
free -h
echo 

echo "Disk Usage:" 
df -h
echo 

echo "Top 5 Precesses:"
ps aux --sort=-%cpu | head -6
