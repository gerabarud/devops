# Outputs in Linux

## Data Streams
Data streams refer to the flow of data between processes, files, and devices. There are three standard data streams commonly used in Linux:

1. Standard Input (stdin):
    - Standard input, represented by the file descriptor 0, is the default input source for a command or program.
    - By default, stdin is connected to the keyboard, allowing users to enter data interactively.
   - Data can also be redirected from a file or another command to stdin using input redirection (< operator).
2. Standard Output (stdout):
   - Standard output, represented by the file descriptor 1, is the default output destination for a command or program.
   - By default, stdout is connected to the terminal, and the output of a command is displayed there.
   - Data can be redirected from stdout to a file or another command using output redirection (> or >> operators).
3. Standard Error (stderr):
   - Standard error, represented by the file descriptor 2, is used for error messages and diagnostic output.
   - By default, stderr is also connected to the terminal, and error messages are displayed there.
   - Similar to stdout, stderr can be redirected to a file or another command separately using error redirection (2> or 2>> operators).

Usage examples: 

```bash
find /etc -type f
```

The output will promt both stdout and stderr:
> /etc/ssl/openssl.cnf <br>
> find: ‘/etc/ssl/private’: Permission denied <br>
> /etc/ssl/certs/java/cacerts <br>
> /etc/ssl/certs/ca-certificates.crt <br> 

Redirecting errors to null and avoid the command to promt errors:
```bash
find /etc -type f 2> /dev/null 
```
Output will be same as previous one, but without promt any error.

Redirecting the stout to null:
```bash
find /etc -type f > /dev/null 
```
Output will promt only errors:
> find: ‘/etc/polkit-1/localauthority’: Permission denied <br>
> find: ‘/etc/cups/ssl’: Permission denied <br>
> find: ‘/etc/ssl/private’: Permission denied

Redirecting the stout to a file:
```bash
find /etc -type f 1> file.txt
```

Redirecting both stdout and stderr to a file:
```bash
find /etc -type f $> file.txt
```

Redirecting the stout to a place and stderr to a different place:
```bash
find /etc -type f 1>find_results.txt 2>find_errors.txt 
```

## Exit codes
Exit codes are numeric values that a command or program returns to the shell when it finishes executing. It provide information about the success or failure of the command or program execution. It allow scripts to determine the outcome of a command and perform appropriate actions based on that outcome.

Checking on the terminal
```bash
ls -l
echo $?
```
Output
>0

```bash
ls -l /not_exist
echo $?
```
Output
>2

### Redirecting output to a log file
```bash
#!/bin/bash

pack=notexits

sudo apt install $pack >> package_install_results.log

if [ $? -eq 0 ]
then
    echo "The installation of $pack was successful"
    echo "The new command is available here:"
    which $pack
else
    echo "$pack failed to install" >> package_install_results.log
fi

echo "The exit code is: $?"
```

### Controling exit codes in a script
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
Then, check the exit code in the terminal
```bash
echo $?
```
Output
> 0