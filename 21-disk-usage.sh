#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=10

while IFS= read -r line
do 
    USAGE=$( echo $line | awk '{print $6}' | cut -d "%" -f1 )
    PARTATION=$( echo $line | awk '{print $7}' )

    if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
        MESSAGE+="High Disk Usage on $PARTATION: $USAGE \n"
    fi
done <<< "$DISK_USAGE"

echo -e "$MESSAGE"