#!/bin/bash

NUM1=40
NUM2=50

SUM=$(($NUM1+$NUM2))

echo "Sum is $SUM"

#arrays

FRUITS=("Banana" "Apple" "pappaya")
echo "all movies are : ${MOVIES[@]}"
echo "first movie is : ${MOVIES[00]}"
echo "second movie is : ${MOVIES[1]}"
echo "third movie is : ${MOVIES[2]}"