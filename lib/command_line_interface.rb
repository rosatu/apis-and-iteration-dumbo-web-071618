def welcome
  # puts out a welcome message here!
  puts "WELCOME TO THE STARS!!!"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
  return character.downcase 
end
