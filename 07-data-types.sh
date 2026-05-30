#!/bin/bash

NUM1=40
NUM2=50

SUM=$(($NUM1+$NUM2))

echo "Sum is $SUM"

#arrays

FRUITS=("Banana" "Apple" "pappaya")
echo "all fruitss are : ${FRUITS[@]}"
echo "first fruit is : ${FRUITS[00]}"
echo "second fruit is : ${FRUITS[1]}"
echo "third fruit is : ${FRUITS[2]}"