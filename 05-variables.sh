#!/bin/bash

#TIME_STAMP=$(date)
#echo "$TIME_STAMP"

START_TIME=$(date)

sleep 10

END_TIME=$(date)

TOTAL_TIME=$(($START_TIME-$END_TIME))
echo "script execuited in $TOTAL_TIME seconds"


