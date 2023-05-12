#!/bin/bash

myName="Gerardo"
myCountry="Argentina"
# Catch the output of a command in a variable
now=$(date '+%Y-%m-%d')

echo "My name is $myName, I'm from $myCountry"
echo "Today is $now"
echo "My user is $USER"
echo "Current directory files/directories: $(ls -l)"