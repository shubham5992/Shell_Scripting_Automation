#!/bin/bash

# provide email recipient
recipient="abc@gmail.com"

# provide disk usage percentage
disk_usage=$(df -h / | awk 'NR==2 {print $5}')

# Remove the '%' sign from disk_usage
disk_usage="${disk_usage%\%}"

# Check if disk usage is greater than 90%
if [ "$disk_usage" -gt 90 ]; then
    echo "Disk usage is beyond 90%: $disk_usage%"
    
    # Send email alert
    mail -s "Disk Alert - Usage: $disk_usage%" "$recipient" <<EOF
    Disk usage is beyond 90% on server $(hostname). Current usage: $disk_usage%
    Please take necessary action to free up disk space.
EOF
    
    # Log alert
    echo "$(date +"%Y-%m-%d %T") - Disk usage alert sent. Usage: $disk_usage%" >> /var/log/disk_alert.log
else
    echo "No worries you are in safe zone: $disk_usage%"
fi
