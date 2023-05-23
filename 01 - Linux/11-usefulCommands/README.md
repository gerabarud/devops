# Useful commands on Linux

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