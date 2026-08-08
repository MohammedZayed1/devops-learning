echo "===================================="
echo "SERVER INFORMATION"
echo "===================================="
echo 

echo "--- SERVER ---"
echo "Hostname: $(hostname)"
echo "Date:     $(date)"
echo -e "Uptime:   $(uptime)\n" 

echo "--- USERS ---"
echo "Current User: $(whoami)"
echo -e "Logged-in Users: $(who | wc -l)\n"

echo "--- CPU ---"
echo "Top Process by CPU:"
ps aux --sort=-%cpu
echo

echo "--- MEMORY  ---"
ps aux --sort=-%mem
echo

echo "--- DISK ---"
df -h
echo 

echo "--- NETWORK ---"
echo "IP Addresses:"
hostname -I
echo 
echo "Open Ports:"
ss -tuln | grep LISTEN | awk '{print $5}'
echo 


echo "--- PACKAGES ---"
echo "Git:     $(git --version)"

echo "--- LOGS ---"
echo "Errors Count:  $(grep -c ERROR /opt/inventory-app/logs/app-log.log)"
echo "Warnings Count:  $(grep -c WARN /opt/inventory-app/logs/app-log.log)"

echo "===================================="
echo "Report generated: $(date)"
echo "===================================="
