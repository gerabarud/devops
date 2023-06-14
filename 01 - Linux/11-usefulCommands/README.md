Useful commands on Linux

Table of contents

- [awk](#awk)
  - [Field operations](#field-operations)
  - [Condition-based processing:](#condition-based-processing)
  - [Arithmetic and calculations](#arithmetic-and-calculations)
  - [String manipulation and regular expressions](#string-manipulation-and-regular-expressions)
  - [Control flow and variables](#control-flow-and-variables)
- [rsync](#rsync)
- [sed](#sed)
  - [Search and replace](#search-and-replace)
  - [Delete lines](#delete-lines)
- [tee](#tee)
  - [Redirect output to a file:](#redirect-output-to-a-file)
  - [Append output to an existing file:](#append-output-to-an-existing-file)
  - [Write output to multiple files:](#write-output-to-multiple-files)

## awk

The `awk` command is a versatile text-processing tool used to extract and manipulate data from text files or streams based on specified patterns and actions. `awk` operates on a line-by-line basis, splitting each line into fields and performing actions on those fields.

Basic syntax
```bash
awk 'pattern { action }' file
```

Some commonly used features and functionalities of awk are:

### Field operations

Prints the first field (space/tab delimited) of each line
```bash
awk '{ print $1 }' file: 
```

Prints the first and third fields of each line
```bash
awk '{ print $1, $3 }' file: 
```

Uses ':' as the field separator and prints the second field of each line
```bash
awk -F':' '{ print $2 }' file
```
### Condition-based processing:

Prints the lines that match the specified pattern
```bash
awk '/pattern/ { print }' file: 
```

Prints the lines where the value of the third field is greater than 50
```bash
awk '$3 > 50 { print }' file
```
### Arithmetic and calculations

Calculates the sum of the values in the first field and prints the total at the end
```bash
awk '{ sum += $1 } END { print sum }' file
```

### String manipulation and regular expressions

Replaces occurrences of "old" with "new" in lines matching the pattern and prints the modified lines
```bash
awk '/pattern/ { gsub("old", "new", $0); print }' file
```

Prints the lines where the first field matches the specified regular expression pattern
```bash
awk '{ if ($1 ~ /pattern/) print }' file
```


### Control flow and variables

Uses an if statement to conditionally print "High" or "Low" based on the value of the first field
```bash
awk '{ if ($1 > 10) print "High"; else print "Low" }' file
```

## rsync

rsync is used for file synchronization and data transfer between systems.

Here's the basic syntax of the rsync command:

```bash
rsync [options] source destination
```

Here are some commonly used options with rsync:
- -a (or --archive): Preserves the file permissions, ownership, timestamps, and recursively copies directories.
- -b (or --backup): Create backups of files that are being overwritten or deleted during the synchronization process. This option is useful for preserving the original versions of files before they are modified or deleted.
- -v (or --verbose): Provides verbose output, showing detailed information about the files being transferred.
- -r (or --recursive):
- -u (or --update): Skips files that are already newer in the destination.
- -n (or --dry-run): Performs a dry run, showing what would be transferred without actually copying any files.
- -z (or --compress): Compresses data during transfer, reducing the amount of data sent over the network.

Here are a few examples of using rsync:

Copy a file from a local directory to a remote server:
```bash
rsync /path/to/local/file.txt user@remote:/path/to/destination/
```

Synchronize the contents of a local directory with a remote directory (human readable):
```bash
rsync -avzh /path/to/local/directory/ user@remote:/path/to/destination/
```

Copy files from a remote server to a local directory:

```bash
rsync -avz user@remote:/path/to/source/ /path/to/local/destination/
```

Exclude specific files or directories during synchronization:
```bash
rsync -avz --exclude='*.txt' /path/to/source/ user@remote:/path/to/destination/
```

Create backups of any files that are modified or deleted in the synchronize process.
```bash
rsync -avb /path/to/local/ user@remote:/path/to/remote/
```

## sed

The sed command, short for "stream editor," is used to perform various operations on text streams, such as searching, replacing, inserting, and deleting text based on specified patterns or rules.

> OPTIONS: <br>
    -i (edit files in place)

### Search and replace

Search and replace an string (just one replacement on each line of the input file)
```bash
sed -i 's/<PATTERN>/<REPLACEMENT>/' file
```

Search and replace an string (replaces all occurrences on each line) 
```bash
sed -i 's/<PATTERN>/<REPLACEMENT>/g' file
```

### Delete lines

Deletes the specified lines (N and Nd represent line numbers or ranges)
``` bash
sed 'N;Nd' file
```

Deletes lines matching the specified pattern
```bash
sed '/pattern/d' file
```

## tee
The `tee` command in Linux is used to read from standard input and write to both standard output and one or more files simultaneously. 

The basic syntax of the `tee` command is as follows:

```bash
command | tee [OPTION]... [FILE]...
```

Here's how the `tee` command works:

1. It reads the input from the preceding command or script via the standard input (stdin).
2. It writes the input to the standard output (stdout), which is usually displayed on the terminal.
3. It also writes the input to the specified file(s) simultaneously.

Some commonly used options with the `tee` command include:

- `-a` or `--append`: Appends the output to the specified file(s) instead of overwriting them.
- `-i` or `--ignore-interrupts`: Ignores interrupt signals, such as `Ctrl+C`, and continues writing to the files.
- `-p` or `--output-error`: Returns an exit status of 0 even if write errors occur.

Here are a few examples to illustrate the usage of the `tee` command:

### Redirect output to a file:
   ```bash
   command | tee output.txt
   ```
   This command runs a command and saves its output to both the terminal and the file `output.txt`.

### Append output to an existing file:
   ```bash
   command | tee -a output.txt
   ```
   This command appends the output of a command to an existing file named `output.txt` while also displaying it on the terminal.

### Write output to multiple files:
   ```bash
   command | tee file1.txt file2.txt
   ```
   This command saves the output of a command to both `file1.txt` and `file2.txt`, in addition to displaying it on the terminal.
