#!/bin/bash
user_id=$(id -u)
# check root access or not
if [ $user_id -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi

echo "continuing..."

#installing mysql

dnf list installed mysql

if [ $? -ne 0 ]; then
    echo "installing mysql"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "installing mysql failed ! "
        exit 1
    else
        echo "installling mysql success"
    fi
else 
    echo "mysql is already installed"
fi