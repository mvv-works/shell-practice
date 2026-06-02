#!/bin/bash

set -e

user_id=$(id -u)

LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"  # /home/ec2-user/shell-logs/10-logs.sh.log
TIMESTAMP=$(date "+%Y-%m-%d  %H:%M:%S")

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# check root access or not
if [ $user_id -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi





for package in $@
do 
    echo "$TIMESTAMP [INFO] installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        
    else
        echo -e "$TIMESTAMP [INFO] $package is already insalled.. $Y skipping $N"
    fi
done


