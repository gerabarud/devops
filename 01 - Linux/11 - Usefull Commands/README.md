Useful commands on Linux

Table of contents

- [`awk`](#awk)
  - [Field operations](#field-operations)
  - [Condition-based processing:](#condition-based-processing)
  - [Arithmetic and calculations](#arithmetic-and-calculations)
  - [String manipulation and regular expressions](#string-manipulation-and-regular-expressions)
  - [Control flow and variables](#control-flow-and-variables)
- [`dd`](#dd)
- [`diff`](#diff)
- [`rsync`](#rsync)
- [`sed`](#sed)
  - [Search and replace](#search-and-replace)
  - [Delete lines](#delete-lines)
- [`tee`](#tee)
  - [Redirect output to a file:](#redirect-output-to-a-file)
  - [Append output to an existing file:](#append-output-to-an-existing-file)
  - [Write output to multiple files:](#write-output-to-multiple-files)
- [`xargs`](#xargs)

## `awk`

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

## `dd`

Used for copying and converting files and data streams. It is often referred to as "disk dump" because it can be used for low-level copying and manipulation of data, including the creation of disk images.

**Basic Usage:**
```bash
dd [options] if=input_file of=output_file
```

- `options`: Various options that customize the behavior of `dd`.
- `if`: Specifies the input file or data source.
- `of`: Specifies the output file or destination.

**Common Options:**

- `bs=BYTES`: Specifies the block size for data transfer (e.g., `bs=1M` for 1 megabyte).
- `count=BLOCKS`: Limits the number of blocks to copy or convert.
- `iflag=FLAGS`: Sets input flags (e.g., `iflag=direct` for direct I/O).
- `oflag=FLAGS`: Sets output flags (e.g., `oflag=direct` for direct I/O).
- `status=WHEN`: Controls when to display the status of the operation (e.g., `status=progress` for progress updates).
- `seek=BLOCKS`: Skips the specified number of blocks in the output file before copying data.
- `skip=BLOCKS`: Skips the specified number of blocks in the input file before copying data.
- `conv=CONVERSION`: Performs specified conversions on the data as it is copied (e.g., `conv=sync` for synchronous write).

**Usage Examples:**

1. **Create a Disk Image from a Device:**
   ```bash
   sudo dd if=/dev/sdX of=disk_image.img bs=4M
   ```
   
2. **Copy a File:**
   ```bash
   dd if=input_file.txt of=output_file.txt bs=1024
   ```
   
3. **Zero Out a Disk:**
   ```bash
   sudo dd if=/dev/zero of=/dev/sdX bs=4M
   ```
   Be extremely cautious when using this command, as it will overwrite the entire disk with zeros, effectively erasing all data.

4. **Monitor Progress of a Copy Operation:**
   ```bash
   dd if=input_file of=output_file bs=1M status=progress
   ```
   The `status=progress` option displays progress updates during the copy operation.

5. **Convert a File from One Format to Another:**
   ```bash
   dd if=input.bin of=output.iso conv=sync
   ```
   This example converts `input.bin` to `output.iso` and ensures that the output file is synchronized.

## `diff`

The `diff` command is used to compare and find differences between two text files or directories. 

**Basic Usage for Comparing Two Text Files:**
```bash
diff file1.txt file2.txt
```

**Common Options:**

- `-q`, `--brief`: Show only whether the files differ, not the details of the differences.
- `-i`, `--ignore-case`: Ignore differences in case when comparing text files.
- `-r`, `--recursive`: Compare directories recursively.
- `-u`, `--unified`: Output a unified diff format, which includes a few lines of context for each difference.
- `-w`, `--ignore-all-space`: Ignore white space when comparing text files.
- `-B`, `--ignore-blank-lines`: Ignore changes that just insert or delete blank lines.
- `-y`, `--side-by-side`: Display the differences side by side.

**Usage Examples:**

1. **Comparing Two Files and Displaying Differences:**
   ```bash
   diff file1.txt file2.txt
   ```

2. **Comparing Two Directories Recursively:**
   ```bash
   diff -r directory1/ directory2/
   ```

3. **Generating a Unified Diff:**
   ```bash
   diff -u file1.txt file2.txt
   ```

4. **Ignoring Case in Comparison:**
   ```bash
   diff -i file1.txt file2.txt
   ```

5. **Ignoring All White Space:**
   ```bash
   diff -w file1.txt file2.txt
   ```

6. **Comparing Directories and Showing Side-by-Side Differences:**
   ```bash
   diff -r -y directory1/ directory2/
   ```

7. **Checking for Existence of Differences (Quiet Mode):**
   ```bash
   diff -q file1.txt file2.txt
   ```

8. **Ignoring Blank Lines:**
   ```bash
   diff -B file1.txt file2.txt
   ```

## `rsync`

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

## `sed`

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

## `tee`
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

## `xargs`

Used for building and executing commands from standard input (usually the output of another command or a file). It takes the input and converts it into arguments for another command, allowing you to perform actions on multiple items efficiently.

**Basic Syntax:**
```
xargs [options] [command]
```

**Key Options:**
- `-I {}`: Specifies a placeholder (`{}`) to represent the input argument.
- `-n N`: Limits the number of arguments passed to the command for each execution.
- `-p`: Prompts before executing each command.
- `-t`: Displays the command being executed before running it.
- `-a FILE`: Reads input from the specified file instead of standard input.
- `-P N`: run at most N processes at a time

**Examples:**

1. **Using `xargs` with `ls` to List Files:**
   ```bash
   find /path/to/directory -type f | xargs ls -l
   ```
   
2. **Deleting Files with `find` and `xargs`:**
   ```bash
   find /path/to/directory -type f -name "*.txt" | xargs rm
   ```
   
3. **Using a Custom Command:**
   ```bash
   cat file_list.txt | xargs -I {} cp {} /destination/directory/
   ```

4. **Interactive Mode:**
   ```bash
   find /path/to/files -type f | xargs -I {} -t -p mv {} /destination/directory/
   ```
   >This command interactively moves each file to the destination directory, prompting you for confirmation before each move (`-p`) and displaying the command to be executed (`-t`).

5. **Specifying a Custom Delimiter:**
   ```bash
   echo "item1,item2,item3" | xargs -d ',' echo
   ```
   This command uses the `-d` option to specify a custom delimiter (`,` in this case) and then echoes each item separately.

6. **Run parallel tasks**
   ```bash
   cat urls.txt | xargs -P 4 -n 1 wget
   ```