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
  - Operators
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
