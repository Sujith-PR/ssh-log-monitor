#!/bin/bash

# SSH Log Monitor for Ubuntu

# Variables
LOG_FILE="/var/log/auth.log"
TMP_FILE="/tmp/ssh_failures.tmp"
EMAIL="sujithpr455@gmail.com"  # <-- Replace with your email
SUBJECT="SSH Login Alert on $(hostname)"

# Create temporary file if it doesn't exist
touch $TMP_FILE

# Get latest failed login attempts
grep -a "Failed password" $LOG_FILE | while read -r line; do
    # Extract IP address
    IP=$(echo $line | awk '{for(i=1;i<=NF;i++){if($i=="from"){print $(i+1)}}}')
    
    # Check if this IP is already notified
    if ! grep -q "$IP" $TMP_FILE; then
        # Send email alert
        echo -e "Alert: Failed SSH login attempt detected\n\n$line" | mail -s "$SUBJECT" $EMAIL
        
        # Save IP to temporary file to avoid duplicate alerts
        echo "$IP" >> $TMP_FILE
    fi
done
