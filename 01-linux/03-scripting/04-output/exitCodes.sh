#!/bin/bash

directory=/etc

if [ -d $directory ]
then
    echo "The directory $directory exists"
    exit 0
else
    echo "The directory $directory doesn't exists"
    exit 1
fi

echo "This it wont promt"