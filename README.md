# Ruby 3
Everything you need to know to prep for Ruby Association Certified Ruby Programmer Silver version 3

## Requirements
- Editor like rubymine, vscode, vim, etc.
- Git
- Ruby 3 (at least 3.1)

## Links
- https://www.ruby.or.jp/en/certification/examination/
- https://ruby-doc.org/3.1.6
- https://clearcodewizards.com/exams

## Table of contents
- Syntax
  - [Comment](#comment)
  - [Reserved words](#reserved-words)
  - [Literals](#literals) (e.g., numbers, booleans, strings, characters, arrays, hashes)
  - [Variables, constants and scope](#variables-constants-and-scope)
  - [Operators](#operators)
  - [Conditional branching](#conditional-branching)
  - [Loops](#loops)
  - [Methods](#methods)
  - [Blocks](#blocks)
  - [Exception handling](#exception-handling)
  - [Class definition](#class-definition)
  - [Module definition](#module-definition)

- Object orientation
  - [Inheritance](#inheritance)
  - [Polymorphism](#polymorphism)
  - [Mix-in](#mix-in)

- Built-in libraries
  - [Well-used built-in classes and modules](#well-used-classes-and-modules)
    (e.g., Object, Numerical classes, String, Array, Hash, Kernel, Enumerable, Comparable)

## Syntax

### Comment
Let us write a simple program in ruby. All ruby files will have extension .rb. So, put the following source code in a test.rb file.
```ruby
#
# This is a comment
#
puts 'Do you like Ruby?'
answer = gets

puts "Answer: #{answer}"
```
Now run this file with ruby
```bash
$ ruby test.rb
```

### Reserved words
Since Ruby is case sensitive you can almost use anything for naming except these exact words.
| Reserved | Words |  |  | |
| --- | --- | --- | --- | --- |
| BEGIN	| do | next	| then | END |
| else | nil | true | alias | elsif |
| not | undef | and |	end | or |
| unless | begin |	ensure | redo	| until |
| break |	false | rescue | when | case |
| for |	retry |	while | class |	if |
| return | def | in | self | \_\_FILE\_\_ |
| defined? | module | super | \_\_LINE\_\_ | |

### Literals
```ruby
#
# Literals
#
integer = 1
integer_thousands = 1_000 # this is prefered for easy reading but 1000 works as well
float = 1.25

hexadecimal = 0xff

octal = 025 # always start with a 0 and base 8 so the decimal value is 21 in this case

boolean = true # false

string = 'This is a string'
string_double_quotes = "This is a string but used icw #{variable}"

character = 'a' # actually a string but of size 1
special_character = "\n" # special characters need double quotes to work
escape_character = 'That\'s right'

array = [1, 2, 3, 4, 5]

hash = { 'key' => 'value', 'key2' => 'value2' } # also called dictonary
hash_symbols = { key: 'value', key2: 'value2' }
```

### Variables, constants and scope
Variables are the memory locations, which hold any data to be used by any program.<br>
There are five types of variables supported by Ruby.

#### Local variables
Local variables begin with a lowercase letter or _.<br>
Local variables are the most used variables and prefered over global variables.<br>
A local variable can be used everywhere but not accessed from everywhere. The scope of a local variable is always in the same class, module, method or block.

```ruby
#
# Local variables
#
local_variable = 'This is a local variable'

def puts_local_variable
  puts local_variable
end

puts local_variable
puts_local_variable # nothing
```
If you run the program above you will notice that you only see the text once. This is because the local_variable is not accessible from another method.
The other way around works the same, see example below.
```ruby
#
# Local variables
#
def puts_local_variable
  local_variable = 'This is a local variable'
  puts local_variable
end

puts local_variable # nothing
puts_local_variable
```

#### Global variables
Global variables begin with $.<br>
Global variables are accessible from everywhere.

```ruby
#
# Global variables
#
$global_variable = 'This is a global variable'

def puts_global_variable
  puts $global_variable
end

puts $global_variable
puts_global_variable
```

#### Instance variables
Instance variables begin with @ and are used in classes.<br>
Instance variables are only accessible from instance methods.
```ruby
#
# Instance variables
#
class Var
  def initialize(instance_variable)
    @instance_variable = instance_variable
  end

  def instance_method
    puts @instance_variable
  end

  def self.class_method
    puts @instance_variable
  end
end

var = Var.new('This is an instance variable')
var.instance_method

Var.class_method # nothing
```

#### Class variables
Class variables begin with @@ and are used in classes but are not common.<br>
The big difference between instance variables is that class variables are accessible from class and instance methods.

#### Constants
Constants begin with an uppercase and so are classes which means classes are actually stored in constants.<br>
For readability it's better to use all uppercase for constants and are accessible from everywhere but only set once.
```ruby
#
# Constants
#
class RubyConstant
  AUTHOR = 'Jeroen Nijhof'

  def self.author
    puts AUTHOR
  end
end

RubyConstant.author
```

### Operators
#### Arithmetic operators
Assume variable a holds 10 and variable b holds 20

| Operator | Description | Example |
| --- | --- | --- |
| +	| Addition − Adds values on either side of the operator. | a + b will give 30 |
| −	| Subtraction − Subtracts right hand operand from left hand operand. | a - b will give -10 |
| *	| Multiplication − Multiplies values on either side of the operator. | a * b will give 200 |
| /	| Division − Divides left hand operand by right hand operand.	| b / a will give 2 |
| %	| Modulus − Divides left hand operand by right hand operand and returns remainder. | b % a will give 0 |
| ** |	Exponent − Performs exponential (power) calculation on operators.	| a**b will give 10 to the power 20 |

#### Comparison operators
Assume variable a holds 10 and variable b holds 20

| Operator | Description | Example |
| --- | --- | --- |
| == | Checks if the value of two operands are equal or not, if yes then condition becomes true. | (a == b) is not true. |
| != | Checks if the value of two operands are equal or not, if values are not equal then condition becomes true. | (a != b) is true. |
| >	| Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true. | (a > b) is not true. |
| <	| Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true. | (a < b) is true. |
| >= | Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true. | (a >= b) is not true. |
| <= | Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true. | (a <= b) is true. |
| <=> | Combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is greater than the second and -1 if first operand is less than the second. | (a <=> b) returns -1. |
| === | Used to test equality within a when clause of a case statement.	| (1...10) === 5 returns true. |
| .eql? | True if the receiver and argument have both the same type and equal values.	| 1 == 1.0 returns true, but 1.eql?(1.0) is false. |
| equal? | True if the receiver and argument have the same object id.	| if aObj is duplicate of bObj then aObj == bObj is true, a.equal?bObj is false but a.equal?aObj is true. |

#### Assignment operators
Assume variable a holds 10 and variable b holds 20

| Operator | Description | Example |
| --- | --- | --- |
| =	| Simple assignment operator, assigns values from right side operands to left side operand. | c = a + b will assign the value of a + b into c |
| += | Add AND assignment operator, adds right operand to the left operand and assign the result to left operand. | b += a is equivalent to b = b + a |
| -= | Subtract AND assignment operator, subtracts right operand from the left operand and assign the result to left operand. | b -= a is equivalent to b = b - a |
| *= | Multiply AND assignment operator, multiplies right operand with the left operand and assign the result to left operand. | b *= a is equivalent to b = b * a |
| /= | Divide AND assignment operator, divides left operand with the right operand and assign the result to left operand. | b /= a is equivalent to b = b / a |
| %= | Modulus AND assignment operator, takes modulus using two operands and assign the result to left operand.	| b %= a is equivalent to b = b % a |
| **= | Exponent AND assignment operator, performs exponential (power) calculation on operators and assign value to the left operand. | b **= a is equivalent to b = b ** a |

#### Logical operators
Assume variable a holds 10 and variable b holds 20

| Operator | Description | Example |
| --- | --- | --- |
| and | Called Logical AND operator. If both the operands are true, then the condition becomes true. | (a and b) is true. |
| or | Called Logical OR Operator. If any of the two operands are non zero, then the condition becomes true. | (a or b) is true. |
| && | Called Logical AND operator. If both the operands are non zero, then the condition becomes true. | (a && b) is true. |
| \|\| | Called Logical OR Operator. If any of the two operands are non zero, then the condition becomes true. | (a \|\| b) is true. |
| !	| Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true, then Logical NOT operator will make false.	| !(a && b) is false. |
| not	| Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true, then Logical NOT operator will make false.	| not(a && b) is false. |

### Conditional branching
#### If statement
If expressions are used for conditional execution.
The values false and nil are false, and everything else is true.
Notice Ruby uses elsif, not else if nor elif.

```ruby
#
# If statement
#
x = 1
if x > 2
  puts 'x is greater than 2'
elsif x <= 2 && x != 0
  puts 'x is 1'
else
  puts 'I can\'t guess the number'
end
```

#### If modifier
In ruby you can use modifiers for almost every conditional statements.
```ruby
#
# If modifier
#
x = 1
puts 'x is 1' if x == 1
```

#### Ternary operator
A ternary gives you a way to write a compact if/else expression in just one line of code.
I don't recommend the use of this since it makes your code a bit hard to read instead use the if modifier.
First you see a normal if statement followed by if modifier and the ternary way.
```ruby
#
# Ternary operator
#
number = 200
big_number = if number > 100
               true
             else
               false
             end

big_number = false
big_number = true if number > 100

big_number = number > 100 ? true : false
```

#### Unless statement
In Ruby it's not common to use if statements with a not condition instead use the unless statement.
```ruby
#
# Unless statement
#
x = 1 
unless x >= 2
  puts 'x is less than 2'
else
  puts 'x is greater than 2'
end
```

#### Unless modifier
```ruby
#
# Unless modifier
#
x = 1
puts 'x is less than 2' unless x >= 2
```

#### Case statement
Compares the expression specified by case and that specified by when using the === operator and executes the code of the when clause that matches.
The expression specified by the when clause is evaluated as the left operand. If no when clauses match, case executes the code of the else clause.
A when statement's expression is separated from code by the reserved word then, a newline, or a semicolon.
```ruby
#
# Case statement
#
case value
when expr1, expr2
  stmt1
when expr3, expr4
  stmt2
else
  stmt3
end
```
Example
```ruby
#
# Case statement
#
age = 5
case age
when 0..2
  puts 'baby'
when 3..6
  puts 'little child'
when 7..12
  puts 'child'
when 13..18
  puts 'youth'
else
  puts 'adult'
end

city = 'amsterdam'
case city
when 'amsterdam', 'rotterdam', 'denhaag'
  puts 'netherlands'
when 'antwerp', 'brussel'
  puts 'belgium'
else
  puts 'unknown'
end
```

### Loops
Loops in Ruby are used to execute the same block of code a specified number of times.
#### While loop
While loops in ruby are condition based and can be used as modifier. The following example shows you 3 ways to use a while loop.
```ruby
#
# While loop
#
index = 0
number = 5

while index < number  # do is optional
  puts "Inside the loop index = #{index}"
  index += 1
end

index = 0
begin
  puts "Inside the loop index = #{index}"
  index += 1
end while index < number

index = 0
index += 1 while index < number
```

#### Until loop
Exactly the same as while loop but loops when condition is false.
```ruby
#
# Until loop
#
index = 0
number = 5

until index == number
  puts "Inside the loop index = #{index}"
  index += 1
end
```

#### For loop
For loops in Ruby are expression based, so it loops over a set or range of data.
```ruby
#
# For loop
#
for number in 0..5
  puts "Value of local variable is #{number}"
end
```

#### Each loop (Iterator)
The each iterator is the most used in Ruby, the variables are scoped in the each block and not accessible outside the block.
```ruby
#
# Each iterator
#
numbers = [0, 1, 2, 3, 4, 5]
numbers.each do |number|
  puts "Value of scoped variable number is #{number}"
end

hash = { a: 0, b: 1, c: 2, d: 3 }
hash.each do |key, value|
  puts "The key is #{key} and value is #{value}"
end

hash.each_key do |key|
  puts "The key is #{key} and value is #{hash[key]}"
end
```

#### Break
Terminates the most internal loop. Terminates a method with an associated block if called within the block (with the method returning nil).
```ruby
#
# Break
#
for i in 0..5
  if i > 2 then
    break
  end
  puts "Value of local variable is #{i}"
end
```
What result will this produce?

#### Next
Jumps to the next iteration of the most internal loop. Terminates execution of a block if called within a block (with yield or call returning nil).
```ruby
#
# Next
#
for i in 0..5
  if i < 2 then
    next
  end
  puts "Value of local variable is #{i}"
end
```
What result will this produce?

#### Redo
Restarts this iteration of the most internal loop, without checking loop condition. Restarts yield or call if called within a block.
```ruby
#
# Redo
#
for i in 0..5
   if i < 2 then
      puts "Value of local variable is #{i}"
      sleep(1)
      redo
   end
end
```
Why is a sleep method used?

#### Retry
Same as redo but arguments to the iterator are re-evaluated, meaning the loop starts from the beginning with the start values.
```ruby
#
# Retry
#
for i in 1..5
   retry if some_condition # restart from i == 1
end
```

### Methods
Ruby methods are very similar to functions in any other programming language. Ruby methods are used to bundle one or more repeatable statements into a single unit.

Method names should begin with a lowercase letter. If you begin a method name with an uppercase letter, Ruby might think that it is a constant and hence can parse the call incorrectly.

Methods should be defined before calling them, otherwise Ruby will raise an exception for undefined method invoking.

So how to define and call a method?
```ruby
#
# Methods
#
def ruby_method
  puts 'I love Ruby'
end

ruby_method
```

#### Return values
The last variable or expression in a method is automatically returned as value.
You can use the keyword return to exit a method earlier.
```ruby
#
# Return values
#
def test
  'This is a test'
end

puts test

def test_variable
  variable = 'This is a test'
end

puts test_variable

def test_return
  return 'Test return' if true

  'This will never be reached'
end

puts test_return
```

#### Arguments
Most of the time you want a method to do something with data so you can define arguments for a method to do so.
```ruby
#
# Arguments
#
def multiply(a, b)
  a * b
end

c = multiply(2, 4)
```
Ruby gives you an error when you call this method without arguments.
```ruby
in `multiply': wrong number of arguments (given 0, expected 2) (ArgumentError)
```
You can however supply default values so the method will work even when you don't use arguments.
```ruby
#
# Default values for arguments
#
def multiply(a = 2, b = 4)
  a * b
end

puts multiply
```
Add this point arguments can make your life harder and not easier since it doesn't give you an error when you forget a argument or use the wrong one.

The solution to this problem? Use keyword arguments.

#### Keyword arguments
Keyword arguments are written by adding : to the arguments. Lets use the same examples but with keyword arguments.
```ruby
#
# Keyword arguments
#
def multiply(a:, b:)
  a * b
end

c = multiply(a: 2, b: 4)
```
Ruby gives you an error when you call this method without arguments.
```ruby
in `multiply': missing keywords: :a, :b (ArgumentError)
```
You see the difference? It's way more clear what's going wrong.

Like with positional arguments you can use default values with keyword arguments.
```ruby
#
# Default values for arguments
#
def multiply(a: 2, b: 4)
  a * b
end

puts multiply
```

### Blocks
You have seen how Ruby defines methods where you can put number of statements and then you call that method. Similarly, Ruby has a concept of Block.

A block consists of chunks of code.
You assign a name to a block.
The code in the block is always enclosed within braces ({}).
A block is always invoked from a function with the same name as that of the block. This means that if you have a block with the name test, then you use the function test to invoke this block.
You invoke a block by using the yield statement.

#### Yield Statement
Let's look at an example of the yield statement

```ruby
#
# Blocks
#
def test
  puts 'You are in the method'
  yield
  puts 'You are again back to the method'
  yield
end

test { puts 'You are in the block' }
```
This will produce the following result
```
You are in the method
You are in the block
You are again back to the method
You are in the block
```

You also can pass arguments with the yield statement. Here is an example

```ruby
#
# Blocks with arguments
#
def test
   yield 5
   puts 'You are in the method test'
   yield 100
end

test { |i| puts "You are in the block #{i}" }
```
This will produce the following result
```
You are in the block 5
You are in the method test
You are in the block 100
```
Here, the yield statement is written followed by arguments. You can even pass more than one argument. In the block, you place a variable between two vertical lines (||) to accept the arguments. Therefore, in the preceding code, the yield 5 statement passes the value 5 as a argument to the test block.

If you want to pass more than one parameters, then the yield statement becomes

```ruby
yield a, b
```
and the block is
```ruby
test { |a, b| statement }
```
The arguments are separated by commas.

#### BEGIN and END blocks
Every Ruby source file can declare blocks of code to be run as the file is being loaded (the BEGIN blocks) and after the program has finished executing (the END blocks).

```ruby
#
# BEGIN and END blocks
#
BEGIN { 
   # BEGIN block code 
   puts "This will run before anything else"
} 

END { 
   # END block code 
   puts "This will run when the main code is finished"
}

# MAIN block code 
puts "MAIN code block"
```

### Exception handling
The execution and the exception always go together. If you are opening a file, which does not exist, then if you did not handle this situation properly, then your program is considered to be of bad quality.

The program stops if an exception occurs. So exceptions are used to handle various type of errors, which may occur during a program execution and take appropriate action instead of halting program completely.

Ruby provide a nice mechanism to handle exceptions. We enclose the code that could raise an exception in a begin/end block and use rescue clauses to tell Ruby the types of exceptions we want to handle.

Lets try to open a file which does not exist
```ruby
#
# Exception handling
#
begin
  file = open('./unexistant_file')
  puts 'File opened successfully' if file
rescue
  puts 'File does not exist'
end
```

It's actually a bad habit to catch all errors like this since the file could be there but is not readable. You can fine grain the rescue by using an exception class.
```ruby
#
# Exception handling
#
begin
  file = open('./unexistant_file')
  puts 'File opened successfully' if file
rescue Errno::ENOENT
  puts 'File does not exist'
rescue Errno::EACCES
  puts 'The file got the wrong permissions'
end
```

You can actually catch the error message and backtrace by using the following
```ruby
#
# Exception handling
#
begin
  file = open('./unexistant_file')
  puts 'File opened successfully' if file
rescue Errno::ENOENT => e
  puts e.message
  puts e.backtrace.inspect
end
```

Explain ensure

#### Raise statement
Sometimes you want to raise an error yourself, you can use the raise statement for this
```ruby
#
# Raise statement
#
begin
  file = open('./unexistant_file')
  raise StandardError, 'File is empty' if file.size.zero?

  puts file.readline
rescue Errno::ENOENT
  puts 'File does not exist'
rescue Errno::EACCES
  puts 'The file got the wrong permissions'
end
```

You don't need to use begin when you are already in a block (loops, iterators, methods), it actually makes your code much cleaner
```ruby
#
# Exception handling
#
File.open('./unexistant_file') do |file|
  puts file.readline
rescue Errno::ENOENT
  puts 'File does not exist'
rescue Errno::EACCES
  puts 'The file got the wrong permissions'
end
```

### Class definition
To implement object-oriented programming by using Ruby, you need to first learn how to create objects and classes in Ruby.

A class in Ruby always starts with the keyword class followed by the name of the class. The name should always be in initial capitals.
```ruby
#
# Class definition
#
class User
end
```
To create a new object from the class you simple call the new method
```ruby
user = User.new
```

You probably want to do something more with the object i.e. set the name, you can add parameters to a class with the initialize method (constructor).
```ruby
#
# Class definition
#
class User
  def initialize(name, email)
    @name = name
    @email = email
  end
end

user = User.new('Jeroen', 'jeroen@clearcodewizards.com')
```

To access the instance variables we want to use an instance method

#### Instance method
Instance methods are only available when you have created an object (instance) from the class with the new method.
Lets create an instance method which will return the email from an user oject.
```ruby
#
# Class definition
#
class User
  def initialize(name, email)
    @name = name
    @email = email
  end

  def email
    @email
  end
end

user = User.new('Jeroen', 'jeroen@clearcodewizards.com')
puts user.email
```

Now create an instance method which set the email after the object is already created.
```ruby
#
# Class definition
#
class User
  def initialize(name, email)
    @name = name
    @email = email
  end

  def email
    @email
  end

  def email=(email)
    @email = email
  end
end

user = User.new('Jeroen', 'jeroen@clearcodewizards.com')
puts user.email

user.email = 'jeroen@test.com'
puts user.email
```

But doing this takes time and effort while it's something that everybody is using anyway so ruby came up with helpers for this.
Instead of adding methods for getting and setting you can use the attr_reader, attr_writer or attr_accessor helpers.
This example works the same as above, see the difference?
```ruby
#
# Class definition
#
class User
  attr_accessor :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end

user = User.new('Jeroen', 'jeroen@clearcodewizards.com')
puts user.email

user.email = 'jeroen@test.com'
puts user.email
```

If you only want to be able to read use attr_reader, and if you only need to write to the instance variable use attr_writer.

#### Class method
A class method can be called directly without creating an object (instance) first.
```ruby
#
# Class definition
#
class User
  def self.version
    'v1.0' 
  end
end

puts User.version
```

#### Require
You can store the classes in seperate ruby files and use them in other ruby files by using require and require_relative.
The require statement uses the default ruby library search paths, the require_relative uses current path.

Try it by adding the following code in user.rb file:
```ruby
#
# Class definition
#
class User
  attr_reader :name
  attr_accessor :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end
```
Now write a main.rb file which calls the user class
```ruby
#
# Require statement
#
require_relative 'user'

user = User.new('Jeroen', 'jeroen@clearcodewizards.com')
puts user.name, user.email
```

### Module definition
Modules are a way of grouping together methods, classes, and constants. Modules give you two major benefits.

Modules provide a namespace and prevent name clashes.

Modules implement the mixin facility.

Modules define a namespace, a sandbox in which your methods and constants can play without having to worry about being stepped on by other methods and constants.

```ruby
#
# Module definition
#
module Week
  FIRST_DAY = 'Sunday'

  def self.weeks_in_month
    puts 'You have four weeks in a month'
  end

  def self.weeks_in_year
    puts 'You have 52 weeks in a year'
  end
end

puts Week::FIRST_DAY
Week.weeks_in_month
```
Module constants are named just like class constants, with an initial uppercase letter. The method definitions look similar, too: Module methods are defined just like class methods.

As with class methods, you call a module method by preceding its name with the module's name and a period, and you reference a constant using the module name and two colons.

## Object orientation
### Inheritance
One of the most important concepts in object-oriented programming is that of inheritance. Inheritance allows us to define a class in terms of another class, which makes it easier to create and maintain an application.

Inheritance also provides an opportunity to reuse the code functionality and fast implementation time but unfortunately Ruby does not support multiple levels of inheritances but Ruby supports mixins. A mixin is like a specialized implementation of multiple inheritance in which only the interface portion is inherited.

When creating a class, instead of writing completely new data members and member functions, the programmer can designate that the new class should inherit the members of an existing class. This existing class is called the base class or superclass, and the new class is referred to as the derived class or sub-class.

Ruby supports the concept of subclassing. The syntax for extending a class is simple. Just add a < character and the name of the superclass to your class statement. For example, following define a class BigBox as a subclass of Box
```ruby
#
# Inheritance
#
class Box
  # constructor method
  def initialize(width, height)
    @width = width
    @height = height
  end

  # instance method
  def area
    @width * @height
  end
end

# define a subclass
class BigBox < Box
  # add a new instance method
  def print_area
    puts "Big box area is : #{area}"
  end
end

# create an object
box = BigBox.new(10, 20)

# print the area
box.print_area
```

### Polymorphism
Polymorphism is a made up of two words Poly which means Many and Morph which means Forms. So Polymorphism is a method where one is able to execute the same method using different objects. In polymorphism, we can obtain different results using the same function by passing different input objects. One can also write the if-else statements but that just makes the code more lengthy. To avoid this, the programmers came up with the concept of polymorphism.

In Polymorphism, classes have different functionality but they share common interface. The concept of polymorphism can be implemented in ruby with inheritance and duck typing.

#### Polymorphism using inheritance
One can easily implement polymorphism using inheritance by overriding the superclass methods.
```ruby
#
# Polymorphism using inheritance
#
class Vehicle
  def type
    puts 'Heavy Car'
  end
end

# Using inheritance
class Car < Vehicle
  def type
    puts 'Small Car'
  end
end

# Using inheritance
class Truck < Vehicle
  def type
    puts 'Big Car'
  end
end

[Vehicle.new, Car.new, Truck.new].each do |vehicle|
  vehicle.type
end
```

#### Polymorphism using duck typing
Duck Typing is nothing but working on the idea of what an object can do rather than what it actually is. Or, what operations could be performed on the object rather than the class of the object.
```ruby
#
# Polymorphism using duck typing
#
class Hotel
  def enters
    puts 'A customer enters'
  end

  def type(customer)
    customer.type
  end

  def price(customer)
    customer.price
  end
end

class Single
  def type
    puts 'Single room'
  end

  def price
    puts 'Per night stay is one hundred'
  end
end

class Couple
  def type
    puts 'Double room'
  end

  def price
    puts 'Per night stay is two hundred'
  end
end

hotel = Hotel.new

customer = Single.new
hotel.type(customer)
hotel.price(customer)

customer = Couple.new
hotel.type(customer)
hotel.price(customer)
```

### Mix-in
When a class can inherit features from more than one parent class, the class is supposed to show multiple inheritance.

Ruby does not support multiple inheritance directly but Ruby Modules have another wonderful use. At a stroke, they pretty much eliminate the need for multiple inheritance, providing a facility called a mix-in.

Mix-ins give you a controlled way of adding functionality to classes. However, their true power comes out when the code in the mix-in starts to interact with code in the class that uses it.
```ruby
#
# Mix-in
#
module Math
  def add(value1, value2)
    value1 + value2
  end
end

module Print
  def print(message)
    puts message
  end
end

class Calc
  include Math
  include Print

  def sum(value1, value2)
    print(add(value1, value2))
  end
end

calc = Calc.new
calc.sum(2, 4)
```

## Built-in libraries
### Well-used classes and modules
#### String
A string is a sequence of one or more characters that may consist of letters, numbers, or symbols.

Strings in Ruby are objects, and unlike other languages, strings are mutable, which means they can be changed in place instead of creating new strings.

You can define a string by single or double quotes but single quotes are always used for static strings and double quotes are used
for string interpolation.
```ruby
text = 'This is static text'

value = 'interpolation'
text = "This is string #{value}"
```

##### Downcase
Returns a string containing the downcased characters.
```ruby
s = 'Hello World!' # => "Hello World!"
s.downcase         # => "hello world!"
```

##### Upcase
Returns a string containing the upcased characters.
```ruby
s = 'Hello World!' # => "Hello World!"
s.upcase           # => "hello world!"
```

##### Indexing
Since string is a sequence of characters it acts like an array so you are able to do indexing.
```ruby
text = 'bar'
text[0]      # => "b"
text[2]      # => "r"
text[20]     # => nil
```
When a negative integer index is given, the slice begins at the offset given by counting backward from the end:
```ruby
text = 'bar'
text[-3]      # => "b"
text[-1]      # => "r"
text[-20]     # => nil
```
Instead of only giving the start index you can also define the length:
```ruby
text = 'bar'
text[0, 2]      # => "ba"
text[1, 2]      # => "ar"
text[-2, 2]     # => "ar"
```

##### Sub / Gsub
To replace a piece of string you can use sub and gsub. They both use regular expressions for the search.

The only difference is that sub replace once and gsub replaces all occurences.
```ruby
s = 'hello'
s.sub(/[aeiou]/, '*')  # => "h*llo"
s.gsub(/[aeiou]/, '*') # => "h*ll*"
s.gsub(/[aeiou]/, '')  # => "hll"
s.sub(/ell/, 'al')     # => "halo"
```

#### Array
Ruby arrays are ordered, integer-indexed collections of any object. Each element in an array is associated with and referred to by an index.

Array indexing starts at 0, as in C or Java. A negative index is assumed relative to the end of the array.

Ruby arrays can hold objects such as String, Integer, Fixnum, Hash, Symbol, even other Array objects.
Ruby arrays are not as rigid as arrays in other languages. Ruby arrays grow automatically while adding elements to them.
```ruby
array = Array.new   # actually never used
array = []
array = [1, 2, 3, 4]
array = ['this', 'is', 'an', 'example']
array = %w[this is an example]
array = %i[this is an example]   # array of symbols
```

##### Indexing
```ruby
array = ['foo', 'bar']
array[0]      # => "foo"
array[1]      # => "bar"
array[20]     # => nil
```
When a negative integer index is given, the array element begins at the offset given by counting backward from the end:
```ruby
array = ['foo', 'bar']
array[-2]      # => "foo"
array[-1]      # => "bar"
array[-20]     # => nil
```
Instead of only giving the start index you can also define the length:
```ruby
array = ['foo', 'bar', 'example']
array[0, 2]      # => ["foo", "bar"]
array[1, 2]      # => ["bar", "example"]
array[-2, 2]     # => ["bar", "example"]
```

##### Join
In case you want to join two or more elements you can use join.
```ruby
array = ['foo', 'bar', 'example']
array[1, 2]                # => ["bar", "example"]
array[1, 2].join(' ')      # => "bar example"
```

##### Each
Looping through an array with each can be inline or as block.
```ruby
[1, 2, 3].each { |n| puts "Current number is: #{n}" }
Current number is: 1
Current number is: 2
Current number is: 3

[1, 2, 3].each do |n|
  text = "Current number is: #{n}"
  puts text
end
Current number is: 1
Current number is: 2
Current number is: 3
```
Blocks are used when you need to perform multiple actions to increase the readability.
My take on this, use blocks whenever possible.

##### Map (important)
When you want to transform the data in an array you can use map to loop over all elements and transform the data.
```ruby
array = ['a', 'b', 'c']
array.map { |string| string.upcase }     # ['A', 'B', 'C']

# don't do this
array = ['a', 'b', 'c']
array.each_index { |index| array[index].upcase! }
```

##### Append / Push / Insert
To add an element to an existing array you can use append, push and << operator to add the element on the end of the array.

To put an element anywhere in the array use insert with an index.
```ruby
array = []
array.append('foo')
array.push('bar')
array << 'example'   # ["foo", "bar", "example"]

array.insert(0, '1st')  # ["1st", "foo", "bar", "example"]
array.insert(2, '3rd')  # ["1st", "foo", "3rd", "bar", "example"]
```

##### Shift
To get the first element from an array you can use first,
but when you also want to delete that first element from the array you can use shift.

Commonly used with queues.
```ruby
array = [1, 2, 3]
array.shift    # 1
array          # [2, 3]
```

##### Pop
The same as shift but now on the last element of the array.
```ruby
array = [1, 2, 3]
array.pop      # 3
array          # [1, 2]
```

##### Delete
Deletes all elements from the array that are equal to given argument.

Returns the last deleted element, or nil if no matching element is found.
```ruby
a = ['a', 'b', 'b', 'b', 'c']
a.delete('b')                   # "b"
a                               # ["a", "c"]
a.delete('z')                   # nil
```
NOTE - String.delete returns the string itself while Array.delete only the last deleted element.

#### Hash
A Hash is a collection of key-value pairs like this: "employee" = > "salary". It is similar to an Array,
except that indexing is done via arbitrary keys of any object type, not an integer index.

The order in which you traverse a hash by either key or value may seem arbitrary and will generally not be in the insertion order.
If you attempt to access a hash with a key that does not exist, the method will return nil.
```ruby
hash = Hash.new   # actually never used
hash = {}

hash = { 'key1' => 'value1', 'key2' => 'value2' }
hash['key1']    # "value1"

hash = { :key1 => 'key is an symbol', :key2 => 'value2' }
hash[:key1]    # "value1"

# or using the new way
hash = { key1: 'key is an symbol', key2: 'value2' }
hash[:key1]    # "value1"
```

##### Each
Looping through an hash with each is almost the same as with an array.
The big difference you get both the key and value of an hash element.
```ruby
hash = { 'key1' => 'value1', 'key2' => 'value2' }
hash.each do |key, value|
  puts "Key: #{key}"
  puts "Value: #{value}"
end
```

If you only need the keys you can call keys which return an array with all the keys.
Or in this example using each_key to loop over the keys.
```ruby
hash = { 'key1' => 'value1', 'key2' => 'value2' }
hash.each_key do |key|
  puts "Key: #{key}"
  puts "Value: #{hash[key]}"
end
```

Or only the values you can call values which returns an array with all values.
Or in this example using each_value to loop over all values.
```ruby
hash = { 'key1' => 'value1', 'key2' => 'value2' }
hash.each_value do |value|
  puts "Value: #{value}"
end
```

#### File
The File class is used to handle files within Ruby.
You start by opening a file with File.new or File.open.

A big note is that File.open can be used with a block which automaticly closes the File on the end of the block. That's why you should always use File.open
```ruby
File.open('filename', 'mode') do |file|
   # ... process the file
end
```

##### Modes
- r

  Read-only mode. The file pointer is placed at the beginning of the file. This is the default mode.
- r+

  Read-write mode. The file pointer will be at the beginning of the file.
- w

  Write-only mode. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing.
- w+

  Read-write mode. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing.
- a

  Write-only mode. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing.
- a+

  Read and write mode. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing.

##### Read
You can use the method read to read the contents of a file. You must open the file in any of the read modes when using this method.

```ruby
File.open('test.txt', 'r') do |file|
  puts file.read
end
```
Or use readline to get an array with lines
```ruby
File.open('test.txt', 'r') do |file|
  file.readlines.each do |line|
    puts line
  end
end
```

Instead of opening and closing files you can directly read a file or loop over the lines in a file.
```ruby
puts File.read('test.txt')

# or

File.foreach('test.txt') do |line|
  puts line
end
```

##### Write
Use the write method to write to files. You can use File.open or File.write directly.
```ruby
File.open('test.txt', 'w') do |file|
  file.write("This is a line\nAnd this as well")
end
```
And with File.write
```ruby
File.write('test.txt', "This is a line\nAnd this as well")
```

##### Delete
To delete a file just use the File.delete method
```ruby
File.delete('test.txt')
```

##### Other File methods
There are many, many handy File methods available, here are some examples:
```ruby
# Renaming a file
File.rename("old-name.txt", "new-name.txt")

# File size in bytes
File.size("users.txt")

# Does this file already exist?
File.exists?("log.txt")

# Get the file extension, this works even if the file doesn't exists
File.extname("users.txt")
# => ".txt"

# Get the file name without the directory part
File.basename("/tmp/ebook.pdf")
# => "ebook.pdf"

# Get the path for this file, without the file name
File.dirname("/tmp/ebook.pdf")
# => "/tmp"

# Is this actually a file or a directory?
File.directory?("cats")
```

#### Dir
All files are contained within various directories, and Ruby has no problem handling these too.
Whereas the File class handles files, directories are handled with the Dir class.

##### Chdir
To change directory within a Ruby program, use Dir.chdir as follows. This example changes the current directory to /usr/bin.

```ruby
Dir.chdir('/usr/bin')
```

##### Pwd
You can find out what the current directory is with Dir.pwd

```ruby
puts Dir.pwd   # This will return something like /usr/bin
```

##### Entries
You can get a list of the files and directories within a specific directory using Dir.entries

```ruby
puts Dir.entries('/usr/bin').join(' ')
```
Dir.entries returns an array with all the entries within the specified directory. Dir.foreach provides the same feature.

```ruby
Dir.foreach('/usr/bin') do |entry|
   puts entry
end
```
An even more concise way of getting directory listings is by using Dir's class array method.

```ruby
Dir['/usr/bin/*']
```

##### Mkdir
The Dir.mkdir can be used to create directories.

```ruby
Dir.mkdir('mynewdir')
```
You can also set permissions on a new directory (not one that already exists) with mkdir.

NOTE − The mask 755 sets permissions owner, group, world [anyone] to rwxr-xr-x where r = read, w = write, and x = execute.

```ruby
Dir.mkdir('mynewdir', 755)
```

##### Delete
The Dir.delete can be used to delete a directory. The Dir.unlink and Dir.rmdir performs exactly the same function and are provided for convenience.

NOTE - The directory needs to be empty before it can be deleted.

```ruby
Dir.delete('testdir')
```

#### Enumerable
The Enumerable mixin provides collection classes with several traversal and searching methods, and with the ability to sort.
Arrays and Hashes include Enumerable so you can use methods like sort, reverse, include?, each, etc.

The next methods are the most common and can be asked during the examination.

Use https://ruby-doc.org/3.1.6 to learn what these methods are.

- count
- length
- size
- empty?
- blank?
- find
- find_all
- select
- filter
- first
- last
- min
- max
- sum
- include?
- member?
- sort
- sort_by
- reverse
- chop
- chomp
- replace
- delete
- delete_if
- reject
- reject!
- each_char
- each_slice
- tally
- uniq
