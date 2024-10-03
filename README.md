# Ruby 3
Everything you need to know to prep for Ruby Association Certified Ruby Programmer Silver version 3

## Requirements
- Editor like rubymine, vscode, vim, etc.
- Git
- Ruby 3 (latest)

## Table of contents
- Syntax
  - [Comment](#comment)
  - [Reserved words](#reserved-words)
  - [Literals](#literals) (e.g., numbers, booleans, strings, characters, arrays, hashes)
  - [Variables, constants and scope](#variables-constants-and-scope)
  - [Operators](#operators)
  - [Conditional branching](#conditional-branching)
  - [Loops](#loops)
  - Method calls
  - Blocks
  - Exception handling
  - Method definition
  - Keyword arguments
  - Class definition
  - Module definition

- Built-in libraries
  - Well-used built-in classes and modules
    (e.g., Object, Numerical classes, String, Array, Hash, Kernel, Enumerable, Comparable)

- Object orientation
  - Inheritance
  - Polymorphism by inheritance
  - Mix-in a.k.a modules

## Syntax

### Comment
Let us write a simple program in ruby. All ruby files will have extension .rb. So, put the following source code in a test.rb file.
```ruby
#
# This is a comment
#
puts 'Hello World!'
```
Now run this file with ruby
```bash
$ ruby test.rb
```
This will produce the following result
```
Hello World!
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
for number in 0..5
  puts "Value of local variable is #{number}"
end
```

#### Each loop (Iterator)
The each iterator is the most used in Ruby, the variables are scoped in the each block and not accessible outside the block.
```ruby
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

### Method calls
### Blocks
### Exception handling
### Method definition
### Keyword arguments
### Class definition
### Module definition

## Built-in libraries
### Well-used classes and modules

## Object orientation
### Inheritance
### Polymorphism by inheritance
### Mix-in a.k.a modules
