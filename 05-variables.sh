#!/bin/bash

#TIME_STAMP=$(date)
#echo "$TIME_STAMP"

START_TIME=$(date +%s)

sleep 12

END_TIME=$(date +%s)

TOTAL_TIME=$(($START_TIME-$END_TIME))
echo "script execuited in $TOTAL_TIME seconds"


