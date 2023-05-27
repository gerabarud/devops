Table of Contents
- [Basics](#basics)
  - [Installation](#installation)
  - [Hello World](#hello-world)
  - [Basic Maths](#basic-maths)
  - [Strings](#strings)
  - [Variables](#variables)
  - [Lists](#lists)
  - [Dictionaries](#dictionaries)
  - [Converting Data Types](#converting-data-types)
  - [Help function](#help-function)
- [Scripting](#scripting)
  - [Writing scripts](#writing-scripts)
  - [Comments](#comments)
  - [Coding Style](#coding-style)
  - [Docstrings](#docstrings)
    - [Funtion](#funtion)
    - [Class](#class)
    - [Module](#module)
  - [Funtions](#funtions)
    - [Definition](#definition)
    - [Call](#call)
    - [Parameters](#parameters)
    - [Return Statement](#return-statement)
    - [Default Parameters:](#default-parameters)
    - [Keyword Arguments](#keyword-arguments)
  - [Local vs Global Variables](#local-vs-global-variables)
    - [Local Variables](#local-variables)
    - [Global Variables](#global-variables)
    - [Shadowing](#shadowing)
    - [Best Practices](#best-practices)
  - [User Input](#user-input)
  - [If Statement](#if-statement)
    - [Basic `if` Statement](#basic-if-statement)
    - [`if-else` statement:](#if-else-statement)
    - [`if-elif-else` statement:](#if-elif-else-statement)
    - [Nested `if` statements::](#nested-if-statements)
 
## Basics
### Installation

```bash
sudo apt install python3
```

### Hello World

Open Python3 console:
```bash
python3
```
Type in the console:
```python
print("Hello World!") # Output: Hello World!
exit()
```

### Basic Maths
```python
# ADD
1 + 2 # Output: 3

# SUB
3 - 2 # Output: 1

# MUL
3 * 2 # Output: 6

# FLOAT DIVISION
6 / 2 # Output: 3.0

# CHEKING RESULT TYPE OF A FLOAT DIVISION
type(6 / 2) # Output: <class 'float'>

# INT DIVISION
6 // 2 # Output: 3

# CHECKING TYPE

type(6 // 2) # Output: <class 'int'>

# ANOTHER WAY TO DO MATHS
print(1+2) # Output: 3

# IF MATHS ARE INSIDE OF QUOTES, IT WONT WORK

print("1+2") # Output: 1+2

# THE REASON IS THAT THE TYPE IS STRING
type("1+2") # Output: <class 'str'>
```

### Strings
```python
# Scaping quotes
print("My name is \"Gerardo\"") # Output: My name is "Gerardo"

# Using single quotes outside
print('My name is "Gerardo"') # Output: My name is "Gerardo"

# Using single and double quotes at the same tyme
print('My name\'s "Gerardo"') # Output: My name's "Gerardo"

name = "Gerardo"
country = "Argentina"

# Concatenation
message = "I'm " + name + " and I'm from " + country + "!"
print(message)  # Output: "I'm Gerardo and I'm from Argentina!"

# String Interpolation: embed variables or expressions within strings using f-strings or the format() method
message = f"I'm {name} and I'm from {country}!"
print(message)  # Output: "I'm Gerardo and I'm from Argentina!"

# Accessing Characters
print(name[1])  # Output: "e"

# String Slicing
message = "Hello, world!"
print(message[0:5])  # Output: "Hello"
print(message[7:])  # Output: "world!"

# String Length
print(len(name))  # Output: 7

# String Methods:
message = "Hello, World!"
# lower
print(message.lower())  # Output: "hello, world!"
# upper
print(message.upper())  # Output: HELLO, WORLD!
# split
print(message.split(","))  # Output: ["Hello", " World!"]
# replace
print(message.replace("Hello", "Hi"))  # Output: "Hi, World!"
```

### Variables

```python
# Integer variable
age = 25

# String variable
name = "John Doe"

# Float variable
pi = 3.14

# Boolean variable
is_student = True

# List variable
fruits = ["apple", "banana", "orange"]

# Dictionary variable
person = {"name": "Alice", "age": 30, "city": "New York"}
```

### Lists

```python
# Creating a list
fruits = ["apple", "banana", "orange", "grape"]

# Cheking type
type(fruits) # Output: <class 'list'>

# Accessing elements
print(fruits[0])  # Output: "apple"
print(fruits[2])  # Output: "orange"

# Modifying elements
fruits[1] = "kiwi"
print(fruits)  # Output: ["apple", "kiwi", "orange", "grape"]

# Adding elements
fruits.append("mango")
print(fruits)  # Output: ["apple", "kiwi", "orange", "grape", "mango"]

# Removing elements
fruits.remove("orange")
print(fruits)  # Output: ["apple", "kiwi", "grape", "mango"]

# Another way to remove elements
fruits.pop(2) # Output: 'orange'
print(fruits)  # Output: ["apple", "kiwi", "grape", "mango"]

# Length of the list
print(len(fruits))  # Output: 4

# Checking if an element is in the list
print("apple" in fruits)  # Output: True

# Iterating over elements
for fruit in fruits:
    print(fruit)
```

### Dictionaries

```python
# Creating a dictionary
person = {
    "name": "John Doe",
    "age": 25,
    "city": "New York"
}

# Cheking type
type(person) # Output: <class 'dict'>

# Accessing values
print(person["name"])  # Output: "John Doe"
print(person["age"])  # Output: 25

# Modifying values
person["age"] = 30
print(person)  # Output: {"name": "John Doe", "age": 30, "city": "New York"}

# Adding new key-value pairs
person["occupation"] = "Engineer"
print(person)  # Output: {"name": "John Doe", "age": 30, "city": "New York", "occupation": "Engineer"}

# Removing a key-value pair
del person["city"]
print(person)  # Output: {"name": "John Doe", "age": 30, "occupation": "Engineer"}

# Length of the dictionary
print(len(person)) # Output: 3

# Checking if a key exists in the dictionary
print("name" in person) # Output: True

# Iterating over keys
for key in person:
    print(key, person[key])
```

### Converting Data Types

```python
# Integer Conversion:
int(3.14) # Output: 3

# Float Conversion:
float("5") # Output: 5.0

# String Conversion:
str(42) # Output: "42"

# List Conversion:
list((1, 2, 3)) # Output: [1, 2, 3]

# Tuple Conversion:
tuple([1, 2, 3]) # Output: (1, 2, 3)

# Dictionary Conversion:
dict([("name", "John"), ("age", 25)]) # Output: {"name": "John", "age": 25}

# Boolean Conversion:
bool(0) # Output: False
bool(1)  # Output: True
bool(-1) # Output: True
bool("") # Output: False
bool("hello") # Output: True
bool([]) # Output: False
bool([1, 2, 3]) # Output: True
```

### Help function
```python
help(print)  # Output: Information about the 'print' function
help(list)  # Output: Information about the 'list' class
help(str)  # Output: Information about the 'str' class

import math
help(math)  # Output: Information about the 'math' module

my_list = [1, 2, 3]
help(my_list.append)  # Output: Information about the 'append' method of list objects
```

## Scripting

### Writing scripts

Creating a `.py` file
```bash
nano 01-my_first_script.py
```

Writing a python code
```python
#!/usr/bin/python3

# 01-my_first_script.py
name = "Pythonerd"
age = 25

def greet_person(name, age):
    print(f"Hello, {name}!")
    print(f"You are {age} years old.")

greet_person(name, age)
```

Runing the script
```bash
chmod +x 01-my_first_script.py
./01-my_first_script.py
```

Output
> Hello, Pythonerd! <br>
> You are 25 years old.

### Comments

```python
# This is a single-line comment

"""
This is a multi-line comment.
It can span multiple lines.
"""
```

### Coding Style

- **Indentation:** Use 4 spaces for indentation. Avoid tabs or a mix of spaces and tabs.

- **Line Length:** Keep lines shorter than 79 characters. If necessary, you can break long lines using parentheses or backslashes.

- **Naming Conventions:**
  - **variable and function names:** lowercase letters and underscores (e.g., my_variable, calculate_total()).
  - **constants:** uppercase letters (e.g., MAX_VALUE).
  - **class names:** CamelCase (e.g., MyClass).

- **Blank Lines:** Use blank lines to separate logical sections of code and improve readability.

- **Imports:** Place imports at the top of your script, each on a separate line. Group imports into three sections: standard library imports, third-party library imports, and local imports.

- **Documentation:** Use docstrings to document functions, classes, and modules. See [Docstrings](#docstrings)

- **Consistency:** Follow consistent naming, formatting, and organization practices throughout your codebase.

### Docstrings

Accessing Docstrings

```python
help(calculate_sum)
print(calculate_sum.__doc__)
```

#### Funtion
```python
def calculate_sum(a, b):
    """
    Calculates the sum of two numbers.

    Parameters:
    a (int): The first number.
    b (int): The second number.

    Returns:
    int: The sum of the two numbers.
    """
    return a + b
```

#### Class

```python
class Calculator:
    """
    A simple calculator class.

    Methods:
    add(a, b): Returns the sum of two numbers.
    subtract(a, b): Returns the difference between two numbers.
    """
    def add(self, a, b):
        """Returns the sum of two numbers."""
        return a + b

    def subtract(self, a, b):
        """Returns the difference between two numbers."""
        return a - b
```

#### Module
```python
"""
My Module

This module contains functions and classes for performing various calculations.
"""
def calculate_product(a, b):
    """Calculates the product of two numbers."""
    return a * b
```

### Funtions

#### Definition
```python
def greet():
    print("Hello, world!")
```

#### Call
``` python
greet()  # Output: "Hello, world!"
```

#### Parameters
```python
def greet(name):
    print("Hello, " + name + "!")

greet("Alice")  # Output: "Hello, Alice!"
```

#### Return Statement
```python
def add(a, b):
    return a + b

result = add(3, 5)
print(result)  # Output: 8
```

#### Default Parameters:
```python
def greet(name="world"):
    print("Hello, " + name + "!")

greet()  # Output: "Hello, world!"
greet("Alice")  # Output: "Hello, Alice!"
```

#### Keyword Arguments
You can specify arguments by their parameter names using keyword arguments. This allows you to provide arguments in any order and skip optional arguments:
```python
def greet(first_name, last_name):
    print("Hello, " + first_name + " " + last_name + "!")

greet(last_name="Smith", first_name="John")  # Output: "Hello, John Smith!"
```

### Local vs Global Variables

#### Local Variables
```python
def my_function():
    name = "Alice"  # Local variable
    print(name)

my_function()  # Output: "Alice"
print(name)  # Error: name is not defined (not accessible outside the function)
```

#### Global Variables
```python
count = 0  # Global variable

def increment():
    global count  # Declare that we want to modify the global variable
    count += 1
    print(count)

increment()  # Output: 1
increment()  # Output: 2
print(count)  # Output: 2
```

#### Shadowing
```python
name = "Alice"  # Global variable

def print_name():
    name = "Bob"  # Local variable, shadows the global variable
    print(name)

print_name()  # Output: "Bob"
print(name)  # Output: "Alice" (global variable is not affected)
```

#### Best Practices
- It is generally recommended to use local variables within functions to encapsulate and control the scope of variables.
- Avoid excessive use of global variables, as they can make code harder to understand and maintain.
- If you need to modify a global variable within a function, use the global keyword to indicate your intention explicitly.

### User Input

Basic usage
```python
name = input("Enter your name: ")
print("Hello, " + name + "!")
```

Converting Input to Other Data Types
```python
age = int(input("Enter your age: "))
print("In 10 years, you will be " + str(age + 10) + " years old.")
```

### If Statement

#### Basic `if` Statement
```python
x = 5
if x > 0:
    print("x is positive")
```

#### `if-else` statement:
```python
x = 5
if x > 0:
    print("x is positive")
else:
    print("x is non-positive")
```

#### `if-elif-else` statement:
```python
x = 5
if x > 0:
    print("x is positive")
elif x < 0:
    print("x is negative")
else:
    print("x is zero")
```

#### Nested `if` statements::
```python
x = 5
y = 10
if x > 0:
    if y > 0:
        print("Both x and y are positive")
    else:
        print("x is positive, but y is non-positive")
else:
    print("x is non-positive")
```