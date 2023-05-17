#!/bin/bash

logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

echo "Please enter the name of the package you want to install:"
# stdin
read package

# stdout and stderr
sudo apt install $package -y 1>>$logfile 2>>$errorlog