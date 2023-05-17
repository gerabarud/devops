# Useful command on Linux

## Sed

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