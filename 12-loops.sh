#!/bin/bash
user_id=$(id -u)

LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"  # /home/ec2-user/shell-logs/10-logs.sh.log
TIMESTAMP=$(date "+%Y-%m-%d  %H:%M:%S")

# check root access or not
if [ $user_id -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi


# creating a function and keeping the instillation code in it
# 1st arg -> what are you installing
# 2nd arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [ERROR] installing $1 failed ! " | tee -a $LOGS_FILE
        exit 1
    else
        echo "$TIMESTAMP [INFO] installling $1 success" | tee -a $LOGS_FILE
    fi
}


for package in $@
do 
    echo "$TIMESTAMP [INFO] installing $package"
    dnf list installed $package #&>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y #&>> $LOGS_FILE
        VALIDATE "installing $package" $?
    else
        echo "$TIMESTAMP [INFO] $package is already insalled.. skipping"
    fi
done


