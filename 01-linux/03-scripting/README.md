# Bash Scripting on Linux

### Index:

1. [Hello world](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#hello-world)
2. [Variables](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#variables)
3. [Basic Maths](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#maths)
4. [IF Statements](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#if-statements)
5. [Exit Codes](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#exit-codes)
6. [Loops](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#loops)
   -  [While](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#while)
   -  [For](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#for)
7. [Where to store scripts](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#where-to-store-scripts)
8. [Data Streams](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#data-streams)
9. [Functions](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#functions)
   
### Extras

- [Basics](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#basics)
- [Useful complete script examples](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#examples)
  - [Universal update script](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#universal-update-script)
  - [Compressing logs files](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#compressing-logs-files)
  
## Basics

### Check where bash is located

```bash
which bash
```
Output should be like
> /usr/bin/bash

### Execute an script
```bash
./path_to_script/myscript.sh
```

### Before executing an script, change mode to executable

```bash
sudo chmod +x myscript.sh
```

### Bash shebang
A `shebang` is sequence of characters (#!) used to tell the operating system which interpreter to use to parse the rest of the file.

For bash scripting, at the begining of the script file use:
```bash
#!/bin/bash
```

## Examples

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

>Hint: Avoid using all uppercase letters for variable names, as system-defined variables are typically written in uppercase.

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