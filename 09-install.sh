#!/bin/bash
user_id=$(id -u)
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
        echo "installing $1 failed ! "
        exit 1
    else
        echo "installling $1 success"
    fi
}



#installing mysql

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "installing mysql"
    dnf install mysql -y
    VALIDATE MySQL $?   # 1st arg -> MySQL ; 2nd arg -> exit is based of previosu command
else 
    echo "mysql is already installed"
fi


# installing nginx

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "installing mysql"
    dnf install nginx -y
    VALIDATE nginx $?   # 1st arg -> nginx ; 2nd arg -> exit is based of previosu command
else 
    echo "nginx is already installed"
fi