#!/bin/bash

echo "All variables passed to the script : $@"
echo "Number of variables passed : $#"
echo "First variable : $1"
echo "script name : $0"
echo "who is running this : $USER"
echo "which directory : $PWD"
echo "Home directory : $HOME"
echo "PID of current script : $$" 
sleep 5 &
echo "PID of the background command runnig just now : $!"
wait $!
echo "Line number : $LINENO"
echo "script execuited in $SECONDS seconds"
echo "Random number : $RANDOM"
        
