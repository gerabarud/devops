# Bash Scripting on Shell

Index:
1. [Basics](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#basics)
2. [ Hello world](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#01---hello-world)
3. [ Variables](https://github.com/gerabarud/devops/tree/main/01-linux/03-scripting#02---variables)

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
