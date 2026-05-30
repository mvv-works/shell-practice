#!/bin/bash
user_id=$(id -u)
# check root access or not
if[ user_id -ne 0 ]; then
    echo "please run this script with root access"
fi

