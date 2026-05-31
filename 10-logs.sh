#!/bin/bash
user_id=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"  # /home/ec2-user/shell-logs/10-logs.sh.log

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
        echo "installing $1 failed ! " | tee -a $LOGS_FILE
        exit 1
    else
        echo "installling $1 success" | tee -a $LOGS_FILE
    fi
}



#installing mysql

dnf list installed mysql &>> $LOGS_FILE

if [ $? -ne 0 ]; then
    echo "installing mysql" | tee -a $LOGS_FILE
    dnf install mysql -y  &>> $LOGS_FILE
    VALIDATE mysql $?   # 1st arg -> MySQL ; 2nd arg -> exit is based of previosu command
else 
    echo "mysql is already installed...SKIPPING" | tee -a $LOGS_FILE
fi


# installing nginx

dnf list installed mysql  &>> $LOGS_FILE

if [ $? -ne 0 ]; then
    echo "installing nginx"
    dnf install nginx -y  &>> $LOGS_FILE
    VALIDATE nginx $?   # 1st arg -> nginx ; 2nd arg -> exit is based of previosu command
else 
    echo "nginx is already installed...SKIPPING" | tee -a $LOGS_FILE
fi