bot telegram

https://morioh.com/p/e52ea3fd1198




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
  - [While loop](#while-loop)
  - [For loop](#for-loop)
  - [Tuples](#tuples)
  - [Handling Exceptions](#handling-exceptions)
    - [`try-except` block](#try-except-block)
    - [Handling Multiple Exceptions](#handling-multiple-exceptions)
    - [Using `else` and `finally`](#using-else-and-finally)
    - [Raising Exceptions](#raising-exceptions)
  - [Class](#class-1)
  - [Inheritance](#inheritance)
  - [`pip`](#pip)
    - [Installing Packages:](#installing-packages)
    - [Managing Packages:](#managing-packages)
    - [Package Index (search):](#package-index-search)
    - [`requirements.txt`:](#requirementstxt)
  - [The OS Module](#the-os-module)
  - [Subprocess](#subprocess)
  - [File Handeling](#file-handeling)
    - [Opening and Closing Files](#opening-and-closing-files)
    - [Reading from Files](#reading-from-files)
    - [Writing to Files:](#writing-to-files)
    - [File Position:](#file-position)
    - [File Iteration:](#file-iteration)
  - [Virtual Environments](#virtual-environments)

Fuente: https://www.youtube.com/playlist?list=PLT98CRl2KxKGIazPd2nQEPbG7sQpT8LEj

Create A Professional Grammar Check GUI App With OpenAI GPT API and Python
https://www.youtube.com/watch?v=H0tADg4RodQ

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

### While loop

Basic `while` loop
```python
count = 0

while count < 5:
    print("Count: " + str(count))
    count += 1
```

Infinit loop with a break statement
```python
while True:
    user_input = input("Enter a value (or 'quit' to exit): ")
    if user_input == "quit":
        break
    print("You entered: " + user_input)
```

`while-else` statement
```python
count = 0

while count < 5:
    print("Count: " + str(count))
    count += 1
else:
    print("Loop complete")
```

### For loop

`for` loop with a list:
```python
fruits = ['apple', 'banana', 'cherry']

for fruit in fruits:
    print(fruit)
```

`for` loop with a string:
```python
message = "Hello, World!"

for char in message:
    print(char)
```

`for` loop with a range:
```python
for i in range(5):
    print(i)
```

### Tuples
A tuple is an **ordered collection** of elements enclosed in parentheses ( ). Tuples are similar to lists, but **they are immutable**, meaning their elements cannot be modified once defined.

Creating a Tuple
```python
# Empty tuple
empty_tuple = ()

# Tuple with values
fruits = ('apple', 'banana', 'cherry')

# Tuple with a single value (note the trailing comma)
single_value_tuple = (42,)
```

Accessing Elements
```python
print(fruits[0])  # Output: 'apple'
print(fruits[2])  # Output: 'cherry'
```

Tuple operations
```python
tuple1 = (1, 2, 3)
tuple2 = ('a', 'b', 'c')

# Concatenation
concatenated_tuple = tuple1 + tuple2

# Repetition
repeated_tuple = tuple1 * 3

# Length
print(len(tuple1))  # Output: 5

# Membership
print(2 in tuple1)  # Output: True

# Iteration
for num in tuple1:
    print(num)
```

Tuple Unpacking
```python
fruits = ('apple', 'banana', 'cherry')

fruit1, fruit2, fruit3 = fruits

print(fruit1)  # Output: 'apple'
print(fruit2)  # Output: 'banana'
print(fruit3)  # Output: 'cherry'
```

### Handling Exceptions

#### `try-except` block
```python
try:
    # Code that might raise an exception
    result = 10 / 0
except ZeroDivisionError:
    # Code to handle the ZeroDivisionError exception
    print("Error: Division by zero.")
```

#### Handling Multiple Exceptions
```python
try:
    # Code that might raise exceptions
    file = open('nonexistent_file.txt', 'r')
    result = 10 / 0
except FileNotFoundError:
    # Code to handle the FileNotFoundError exception
    print("Error: File not found.")
except ZeroDivisionError:
    # Code to handle the ZeroDivisionError exception
    print("Error: Division by zero.")
```

#### Using `else` and `finally`

`else`: is executed if no exceptions are raised in the try block. It is typically used to define code that should run when the try block executes successfully.
```python
try:
    # Code that might raise an exception
    result = 10 / 2
except ZeroDivisionError:
    print("Error: Division by zero.")
else:
    print("Result:", result)
```

`finally` is executed regardless of whether an exception occurs or not. It is used to define cleanup code that should always run, such as closing files or releasing resources.
```python
try:
    # Code that might raise an exception
    file = open('data.txt', 'r')
    result = int(file.readline())
except FileNotFoundError:
    print("Error: File not found.")
except ValueError:
    print("Error: Invalid data.")
finally:
    if 'file' in locals():
        file.close()
```

#### Raising Exceptions
It is possible to raise exceptions explicitly using the `raise` statement. It allows you to create and raise custom exceptions or re-raise existing exceptions.

```python
def validate_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative.")
    elif age > 120:
        raise ValueError("Invalid age.")
    else:
        print("Age is valid.")
```

### Class

In object-oriented programming, a class is a blueprint for creating objects (instances) that share common attributes (data) and behaviors (methods). It defines the structure and behavior of objects of that class. Here's an example:

```python
# Define a class
class Car:
    # Class-level attribute
    color = "red"

    # Constructor (initialize object attributes)
    def __init__(self, make, model):
        # Instance-level attributes
        self.make = make
        self.model = model

    # Instance method
    def start_engine(self):
        print("Engine started.")

    # Instance method with parameters
    def drive(self, distance):
        print(f"The car is driving for {distance} miles.")

# Create objects (instances) of the class
car1 = Car("Toyota", "Corolla")
car2 = Car("Honda", "Civic")

# Access attributes and call methods
print(car1.make)       # Output: Toyota
print(car2.color)      # Output: red
car1.start_engine()    # Output: Engine started.
car2.drive(10)         # Output: The car is driving for 10 miles.
```

In this example, the Car class is defined with class-level attribute color and instance-level attributes make and model. The __init__ method is the constructor that initializes the attributes of each object. The class also has instance methods start_engine and drive that define the behavior of the objects.

### Inheritance
Inheritance allows you to define a new class (derived or child class) based on an existing class (base or parent class). The derived class inherits the attributes and methods of the parent class, and it can also add its own unique attributes and methods or override the ones inherited from the parent class. Here's an example of inheritance in Python:

```python

# Parent class
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        print("Animal speaks.")

# Derived class
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)  # Call the parent class constructor
        self.breed = breed

    def speak(self):
        print("Woof!")

    def fetch(self):
        print("Dog fetches.")

# Create objects of the derived class
my_dog = Dog("Buddy", "Labrador")

# Access attributes and call methods
print(my_dog.name)     # Output: Buddy
print(my_dog.breed)    # Output: Labrador
my_dog.speak()         # Output: Woof!
my_dog.fetch()         # Output: Dog fetches.
```
In this example, the Animal class is the parent class, and the Dog class is the derived class that inherits from Animal. The Dog class has its own constructor (__init__ method) that takes additional parameters and calls the parent class constructor using the super() function. The Dog class also overrides the speak method inherited from the Animal class and adds a new method fetch.

### `pip`

`pip` is the package installer for Python. 

#### Installing Packages:

```bash
pip install package_name
```
To install a specific version of a package:
```bash
pip install package_name==version_number
```
To install packages from a requirements file:
```bash
pip install -r requirements.txt
```

#### Managing Packages:

To upgrade a package to the latest version:
```bash
pip install --upgrade package_name
```
To uninstall a package:
```bash
pip uninstall package_name
```
To list installed packages:
```bash
pip list
```

#### Package Index (search):

```bash
pip search package_name
```

#### `requirements.txt`:

You can create a requirements.txt file that lists the required packages for your project. This allows easy installation of all dependencies at once using pip install -r requirements.txt.

```bash
pip freeze > requirements.txt
```

### The OS Module
The `os` module provides a way to interact with the operating system

```python
import os

# File and Directory Operations
os.getcwd()  # Returns the current working directory as a string.
os.chdir(path)  # Changes the current working directory to the specified path.
os.listdir(path)  # Returns a list of all files and directories in the specified path.
os.mkdir(path)  # Creates a new directory at the specified path.
os.remove(path)  # Removes a file at the specified path.
os.rmdir(path)  # Removes an empty directory at the specified path.
os.path.join(path1, path2, ...)  # Joins one or more path components intelligently.

# Process Management:
os.system(command)  # Executes the command in a subshell.
os.popen(command)  # Opens a pipe to or from a command executed in a subshell.
os.kill(pid, signal)  # Sends the specified signal to the process with the given process ID.

# Environment Variables:
os.environ  # A dictionary containing the current environment variables.
os.getenv(name)  # Returns the value of the environment variable with the specified name.

# Miscellaneous Functions:
os.name  # Returns the name of the operating system.
os.path  # A module that provides various functions for working with file paths.
os.sep  # The separator used in file paths (e.g., '/' on Unix-based systems, '\\' on Windows).
os.stat(path)  # Returns information about a file or directory.
os.utime(path, times)  # Sets the access and modified times of a file.
```

### Subprocess
The `subprocess` module provides a way to create new processes, execute external commands, and interact with the system's input and output streams

Example: checking whether the SSH service (sshd) is running or not
```python
import subprocess

def is_sshd_running():
    try:
        # Run the command to check the status of the SSH service
        subprocess.run(['systemctl', 'is-active', 'sshd'], check=True)
        return True  # Service is running
    except subprocess.CalledProcessError:
        return False  # Service is not running

# Call the function to check the SSH service status
if is_sshd_running():
    print("SSH service is running.")
else:
    print("SSH service is not running.")
    print("Starting it...")
    subprocess.call(['systemctl', 'start', 'sshd'])
```

### File Handeling

Example
```python
# Opening a file for reading
try:
    file = open("example.txt", "r")
except FileNotFoundError as e:
    print("The file was not found.")
    print("e")
    exit(1)

# Reading the entire contents of the file
content = file.read()
print(content)

# Closing the file
file.close()

# Opening a file for writing
file = open("output.txt", "w")

# Writing to the file
file.write("Hello, World!")
file.write("\n")
file.write("This is a sample file.")

# Closing the file
file.close()

```

#### Opening and Closing Files
```python
open(filename, mode)  # Opens a file with the specified filename and mode. Modes: reading ('r'), writing ('w'), or appending ('a'), among other options. Returns a file object.

file_object.close()  # Closes the file associated with the file object.
```

#### Reading from Files
```python
file_object.read()  # Reads the entire contents of the file as a string.
file_object.readline()  # Reads a single line from the file.
file_object.readlines()  # Reads all lines from the file and returns them as a list.
```

#### Writing to Files:
```python
file_object.write(string)  # Writes the specified string to the file.
file_object.writelines(list_of_strings)  # Writes a list of strings to the file.
```

#### File Position:
```python
file_object.tell()  # Returns the current position (byte offset) in the file.
file_object.seek(offset, from_what)  # Moves the file position to the specified offset. The from_what parameter determines the reference point (beginning of the file, current position, or end of the file).
```

#### File Iteration:
```python
for line in file_object: ...  # Iterates over the lines of the file.
```

### Virtual Environments

A virtual environment in Python is a self-contained directory that contains its own Python interpreter and a set of installed packages. It allows you to have multiple isolated environments with different versions of Python and libraries on the same machine.

Installation
```bash
sudo apt install python3-virtualenv
```

Creating a virtual enviroment
```bash
cd /tmp
virtualenv -p /usr/bin/python3 my-project 
```

Activating a Virtual Environment:
```bash
source my-project/bin/activate
```

Checking
```bash
which python3
```
Output:
> /tmp/my-project/bin/python3

