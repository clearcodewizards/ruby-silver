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
