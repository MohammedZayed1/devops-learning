echo "=============================="
echo "Logs Analysis Report"
echo "=============================="
echo 

echo "Number of Errors: "
grep -c "ERROR" /opt/inventory-app/logs/app-log.log 
grep "ERROR" /opt/inventory-app/logs/app-log.log
echo 

echo "Number of Warnings:"
grep -c "WARN" /opt/inventory-app/logs/app-log.log
grep "WARN" /opt/inventory-app/logs/app-log.log
echo 

echo "First log:"
head -1 /opt/inventory-app/logs/app-log.log
echo

echo "Last log:"
tail -1 /opt/inventory-app/logs/app-log.log
echo 

echo "Most common level:"
awk '{print $3}' /opt/inventory-app/logs/app-log.log | sort | uniq -c | sort -nr | head -1
echo
