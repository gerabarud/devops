Table of Contents
- [Installation](#installation)
- [Shell](#shell)
  - [Hello World](#hello-world)
- [Basic Maths](#basic-maths)
- [Strings](#strings)

## Installation

```bash
sudo apt install python3
```

## Shell

Open Python3 console:
```bash
python3
```

### Hello World
```python
>>> print("Hello World!")
Hello World!
>>> exit()
```

## Basic Maths
```python
# ADD
>>> 1 + 2
3
# SUB
>>> 3 - 2
1
# MUL
>>> 3 * 2
6
# FLOAT DIVISION
>>> 6 / 2
3.0
# CHEKING RESULT TYPE OF A FLOAT DIVISION
>>> type(6 / 2)
<class 'float'>
# INT DIVISION
>>> 6 // 2
3
# CHECKING TYPE
>>> type(6 // 2)
<class 'int'>
# ANOTHER WAY TO DO MATHS
>>> print(1+2)
3
# IF MATHS ARE INSIDE OF QUOTES, IT WONT WORK
>>> print("1+2")
1+2
# THE REASON IS THAT THE TYPE IS STRING
>>> type("1+2")
<class 'str'>
```

## Strings
Print quotes inside a string
```python
# Scaping quotes
>>> print("My name is \"Gerardo\"")
My name is "Gerardo"
# Using single quotes outside
>>> print('My name is "Gerardo"')
My name is "Gerardo"
# Using single and double quotes at the same tyme
>>> print('My name\'s "Gerardo"')
My name's "Gerardo"
```