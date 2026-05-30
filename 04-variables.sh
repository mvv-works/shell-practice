#!/bin/bash

echo "Please Enter Your User Names:"
read USER_NAME  # read command takes the input from the user
echo "User Name is USER_NAME"

echo "Please Enter Your Password:"
read -s PASSWD  # -s hides the contents of input that we are giving
echo "Password is $PASSWD"
