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
  - Literals (e.g., numbers, booleans, strings, characters, arrays, hashes)
  - Variables, constants and scope
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
float = 1.25
boolean = true # false
string = 'This is a string'
string_double_quotes = "This is also a string"
character = 'a' # actually a string but of size 1
special_character = "\n"

array = [1, 2, 3, 4, 5]

hash = { 'key' => 'value', 'key2' => 'value2' } # also called dictonary
hash_symbols = { key: 'value', key2: 'value2' }

puts integer, float, boolean, string, string_double_quotes, character

puts special_character

puts array[0]
puts array[4]
puts array[5]
puts array.length # or .size alias for .length
puts array.count
puts array.count 2
puts array.to_s

puts hash['key']
puts hash['key2']
puts hash['not_exists']
puts hash.to_s

puts hash_symbols
puts hash_symbols[:key]
puts hash_symbols[:not_exists]
```

### Variables, constants and scope
```ruby
#
# Variables, constants and scope
#
CONSTANTS = 'How are you doing?'

def prompt
  puts CONSTANTS
  reply = ARGF.readline
  puts "\nThank you for your reply\n"
  reply
end

local_reply = prompt
puts "Your answer was #{local_reply}"
puts reply # gives error since variable reply is scoped to prompt method
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
