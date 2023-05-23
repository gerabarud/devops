Table of contents
- [Basics](#basics)
  - [Checking where bash is located](#checking-where-bash-is-located)
  - [Executing an script](#executing-an-script)
  - [Changin script mode to executable](#changin-script-mode-to-executable)
  - [Bash shebang](#bash-shebang)
- [Complete Examples](#complete-examples)
  - [Universal update script](#universal-update-script)
  - [Compressing logs files](#compressing-logs-files)
- [Hello world](#hello-world)
- [Variables](#variables)
- [Maths](#maths)
- [IF Statements](#if-statements)
  - [Basic usage: cheking if a variable is equal to a numer](#basic-usage-cheking-if-a-variable-is-equal-to-a-numer)
  - [Cheking existence of a file](#cheking-existence-of-a-file)
  - [Checking existance of a command. If not, install it](#checking-existance-of-a-command-if-not-install-it)
- [Exit codes](#exit-codes)
- [Loops](#loops)
  - [While](#while)
  - [For](#for)
- [Where to store scripts](#where-to-store-scripts)
- [Data Streams](#data-streams)
- [Functions](#functions)
- [Case Statements](#case-statements)
  - [Example with an integer as selector](#example-with-an-integer-as-selector)
  - [Example with string as selector](#example-with-string-as-selector)
- [Scheduling Jobs](#scheduling-jobs)
  - [at command](#at-command)
  - [cron](#cron)
- [Arguments](#arguments)
- [Color palette](#color-palette)
- [Catch CTRL+C](#catch-ctrlc)
- [Help Panel](#help-panel)

## Basics

### Checking where bash is located

```bash
which bash
```
Output should be like
> /usr/bin/bash

### Executing an script
```bash
./path_to_script/myscript.sh
```

### Changin script mode to executable

```bash
sudo chmod +x myscript.sh
```

### Bash shebang
A `shebang` is sequence of characters (#!) used to tell the operating system which interpreter to use to parse the rest of the file.

For bash scripting, at the begining of the script file use:
```bash
#!/bin/bash
```

## Complete Examples

### Universal update script
```bash
#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    #The host is based on Archo
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error ocurred, please check the $errorlog file"
    fi
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
    #The host is based on Debian
    sudo apt update 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error ocurred, please check the $errorlog file"
    fi
    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "An error ocurred, please check the $errorlog file"
    fi
fi
```

### Compressing logs files
```bash
#!/bin/bash

for file in logfiles/*.log
do
    tar -czvf $file.tar.gz $file
done
```

## Hello world

```bash
#!/bin/bash

echo "Hello World!"

echo "My current working directory is:"
pwd
```

Change mode to executable and run it
```bash
chmod +x 01-helloWorld/helloWorld.sh
./01-helloWorld/helloWorld.sh
```

Output:
> Hello World! <br>
> My current working directory is: <br>
> /home/gbarud/git/devops/01-linux/03-scripting 

## Variables

>**Hint:** Avoid using all uppercase letters for variable names, as system-defined variables are typically written in uppercase.

Printing variables:
```bash
echo "$variable"
```
Printing output of a command:
```bash
echo "$(ls -l)"
```
Printing a system-defined variable:
```bash
echo "$USER"
```
Printing all system-defined variables (enviroment variables):
```bash
env
```

Script file:
```bash
#!/bin/bash

myName="Gerardo"
myCountry="Argentina"
# Catch the output of a command in a variable
now=$(date '+%Y-%m-%d')

echo "My name is $myName, I'm from $myCountry"
echo "Today is $now"
echo "My user is $USER"
echo "Current directory files/directories: $(ls -l)"
```

Change mode to executable and run it
```bash
chmod +x 02-variables/variables.sh
./02-variables/variables.sh
```

Output:
> My name is Gerardo, I'm from Argentina <br>
> Today is 2023-05-12 <br>
> My user is gbarud <br>
> Current directory files/directories: <br>
> total 12 <br>
> drwxr-xr-x 2 gbarud gerardo 4096 may 12 11:50 01-helloWorld <br>
> drwxr-xr-x 2 gbarud gerardo 4096 may 12 12:11 02-variables <br>
> -rw-r--r-- 1 gbarud gerardo 1368 may 12 13:04 README.md <br>
> My name is Gerardo and I'm from Argentina <br>

## Maths

Basic maths expressions on the terminal:
```bash
expr 10 + 10
expr 10 - 10
expr 10 / 10
expr 10 \* 10
expr $variable + 10
```

## IF Statements

### Basic usage: cheking if a variable is equal to a numer
```bash
#!/bin/bash

# Basic usage
mynum=300

if [ $mynum -eq 200 ]
then
    echo "The condition is true"
else
    echo "The condition is false"
fi
```

### Cheking existence of a file
```bash
#!/bin/bash

# Checking system files

if [ -f ./README.md ]
then
    echo "The file exists"
fi
```

Check all the test options to use in an If statement:
```bash
man test
```

### Checking existance of a command. If not, install it
If we want to check a command in an If statement, we have to delete de brackets: 
```bash
#!/bin/bash

# Checking existence of a command

command=htop

if command -v $command
then
    echo "$command is available, let's run it..."
else
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y $command
fi

$command
```

## Exit codes
Controling exit codes in a script
```bash
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
```
Checking the exit code in the terminal
```bash
echo $?
```
Output
> 0

## Loops
### While
```bash
#!/bin/bash

var=1

while [ $var -le 10 ]
do
    echo $var
    var=$(( $var +1 ))
    sleep 0.5
done
```

### For
```bash
#!/bin/bash

for n in {1..10}
do
    echo $n
    sleep 1
done

echo "This is outside the for loop"
```

## Where to store scripts
To execute the script from any location without specifying the path, move it to the `/usr/local/bin` directory and change its ownership to root.
```bash
sudo mv script.sh /usr/local/bin/script
sudo chown root:root /usr/local/bin/script
```
Now can check if the script is in the right place
```bash
which script
```
Output
> usr/local/bin/script

You can execute it from any location just tying:
```bash
script
```

## Data Streams

Redirecting `stdin`, `stdout` and `srderr` to different places in a script

```bash
#!/bin/bash

logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

echo "Please enter the name of the package you want to install:"
# stdin
read package

# stdout and stderr
sudo apt install $package -y 1>>$logfile 2>>$errorlog
```

Runinng it and checking output and errors:
```bash
sudo ./dataStreams.sh
cat /var/log/updater.log
cat /var/log/updater_errors.log
```

## Functions

```bash
#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo "An error ocurred, please check the $errorlog file"
    fi 
}

if grep -q "Arch" $release_file
then
    #The host is based on Archo
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_file
then
    #The host is based on Debian
    sudo apt update 1>>$logfile 2>>$errorlog
    check_exit_status
    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    check_exit_status
fi
```

## Case Statements

### Example with an integer as selector

```bash
#!/bin/bash
finished=0

while [ $finished -ne 1 ]
do
    echo "Select a programming language:"
    echo "1. Python"
    echo "2. Java"
    echo "3. JavaScript"
    echo "4. C++"
    echo "5. Ruby"
    echo "6. Exit"
    read choice

    case $choice in
        1)
            echo "You selected Python."
            ;;
        2)
            echo "You selected Java."
            ;;
        3)
            echo "You selected JavaScript."
            ;;
        4)
            echo "You selected C++."
            ;;
        5)
            echo "You selected Ruby."
            ;;
        6)
            echo "Bye bye."
            finished=1
            ;;
        *)
            echo "Invalid choice."
            ;;        
    esac
done
```

### Example with string as selector
```bash
#!/bin/bash

echo "Enter a fruit name: "
read fruit

case $fruit in
    "apple")
        echo "You selected an apple."
        ;;
    "banana")
        echo "You selected a banana."
        ;;
    "orange")
        echo "You selected an orange."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac
```

## Scheduling Jobs

### at command

Installation
```bash
sudo apt install at
```
Schedulung an script at specific hour
```bash
at 15:30 -f ./myscript.sh
```
Schedulung an script at specific date
```bash
at 15:30 08162023 -f ./myscript.sh
```
List scheduled job 
```bash
atq
```
Delete scheduled job (use the Job ID - you can see it from the previous command)
```bash
atrm <ID>
```

### cron

> **Hint:** Use "fully qualified commands (full path)" in the script when scheduling jobs with cron. You can verify the full path of a command with the command `which`. 

Editing cron: You can add or modify cron jobs for the **current user**
```bash
crontab -e
```
Editing cron for root user
```bash
sudo crontab -u root -e
```

Each line in a crontab file represents a cron job and follows the next format:
```bash
* * * * * command
```
Fields: from left to right:
- Minute (0-59)
- Hour (0-23)
- Day of the month (1-31)
- Month (1-12 or Jan-Dec)
- Day of the week (0-7 or Sun-Sat)
- command to schedule

Special characters:
- **Asterisk (*):** Matches any value. For example, * in the month field means "every month."
- **Comma (,):** Separates multiple values within a field. For example, 1,3,5 in the month field means "January, March, and May."
- **Hyphen (-):** Specifies a range of values. For example, 1-5 in the day of the week field means "Monday to Friday."
- **Slash (/):** Specifies a step value. For example, */15 in the minute field means "every 15 minutes."

Example of a cron job that runs a script every day at 8:00 AM
```bash
0 8 * * * /path/to/script.sh
```

## Arguments

Here's an example of how arguments can be used in a script:

```bash
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
```

Execution
```bash
chmod +x arguments.sh
/arguments.sh A1 A2
```

Output
>Script Name: ./arguments.sh <br>
>Argument 1: A1 <br>
>Argument 2: A2 <br>
>All Arguments: A1 A2 <br>
>Total Number of Arguments: 2

## Color palette

```bash
#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
```

## Catch CTRL+C

Catching CTRL+C for exiting the script execution
```bash
#!/bin/bash

trap ctrl_c INT

ctrl_c(){
	echo "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	exit 1
}
```

## Help Panel

Here is an example of a Help Panel
```bash
#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

helpPanel(){
	echo "\n${yellowColour}[*]${endColour}${grayColour} Usage: ./script.sh${endColour}"
	echo "\n\t${purpleColour}-u${endColour}${yellowColour} <USERNAME>${endColour}"
    echo "\t\t${grayColour} Set user username${endColour}"
	echo "\n\t${purpleColour}-f${endColour}${yellowColour} <FIRST NAME>${endColour}"
    echo "\t\t${grayColour} Set user first name${endColour}"
    echo "\n\t${purpleColour}-l${endColour}${yellowColour} <LAST NAME>${endColour}"
    echo "\t\t${grayColour} Set user last name${endColour}"
	echo "\n\t${purpleColour}-s${endColour}"
    echo "\t\t${grayColour} Show list of users${endColour}"
	echo "\n\t${purpleColour}-h${endColour}"
    echo "\t\t${grayColour} Show this Help Panel${endColour}"
	echo "\n${yellowColour}[*]${endColour}${grayColour} Examples:${endColour}\n"
	echo "\t${blueColour}./script.sh -u gbarud -f Gerado -l Barud${endColour}"
	echo "\t${blueColour}./script.sh -s${endColour}"
	echo "\t${blueColour}./script.sh -h${endColour}\n"
	exit 0
}

helpPanel
```
Output
```bash
[*] Usage: ./script.sh

        -u <USERNAME>
                 Set user username

        -f <FIRST NAME>
                 Set user first name

        -l <LAST NAME>
                 Set user last name

        -s
                 Show list of users

        -h
                 Show this Help Panel

[*] Examples:

        ./script.sh -u gbarud -f Gerado -l Barud
        ./script.sh -s
        ./script.sh -h
```