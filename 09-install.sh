#!/bin/bash
user_id=$(id -u)
# check root access or not
if [ $user_id -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi

echo "continuing..."


echo "what to install:"
read=var1

#installing mysql

dnf list installed $var1

if [ $? -ne 0 ]; then
    echo "installing $var1"
    dnf install $var1 -y

    if [ $? -ne 0 ]; then
        echo "installing $var1 failed ! "
        exit 1
    else
        echo "installling $var1 success"
    fi
else 
    echo "$var1 is already installed"
fi