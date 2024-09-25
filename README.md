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
  - Conditional branching
  - Loops
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
### Loops
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
