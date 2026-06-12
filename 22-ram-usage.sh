#!/bin/bash

RAM_USAGE=$(free -h)
RAM_THRESHOLD=10
SERVER_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)


while IFS= read -r line
do 
    USAGE=$( free | awk '/Mem/ {printf "%.2f%%\n", $3/$2 * 100.0}'| tr -d '%' )
    echo $USAGE

    if [ "$USAGE" -ge "$RAM_THRESHOLD" ]; then
        MESSAGE+="RAM Usage is above 10% "
    fi
done <<< "$RAM_USAGE"

echo -e "$MESSAGE"

sh mail.sh "DevOps Team" "High RAM usage" "$SERVER_IP" "$MESSAGE" "vijayvamsi550@gmail.com" "High RAM usage Alert"