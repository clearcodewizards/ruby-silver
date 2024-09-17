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
