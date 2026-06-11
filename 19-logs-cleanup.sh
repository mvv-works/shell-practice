#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14}

if [ -z $SOURCE_DIR ]; then 
    echo "ERROR:: Missing parameters"
    echo "USAGE:: $0 <source-dir> [days(optional default to 14)]"
    exit 1
fi

if [ ! -d $SOURCE_DIR ];then
    echo "Error: Directory: $SOURCE_DIR does not exist"
    exit 1
fi
