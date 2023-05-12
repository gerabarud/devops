# Bash Scripting on Shell

## Before starting

### Check where bash is located

```bash
which bash
```
Output should be like
> /usr/bin/bash

Execute an script
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
## 01 - Hello world

```bash
#!/bin/bash

echo "Hello World!"

echo "My current working directory is:"
pwd
```

Change mode to executable and run it
```bash
chmod +x 01-HelloWorld/helloworld.sh
./01-HelloWorld/helloworld.sh
```

Output:
> Hello World! <br>
> My current working directory is: <br>
> /home/gbarud/git/devops/01-linux/03-scripting 
