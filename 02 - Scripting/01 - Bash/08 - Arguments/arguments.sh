#!/bin/bash

if [ $# -lt 1 ]
then
    echo "This script requires at least 1 argument"
    echo "Please try again"
    exit 1
fi

echo "Script Name: $0"
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "All Arguments: $@"
echo "Total Number of Arguments: $#"