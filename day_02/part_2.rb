filename = 'day_02_input.txt'
chunks = File.read(filename).split

rules = chunks.select.each_with_index{ |_, i| i % 3 == 0 }
characters = chunks.select.each_with_index{ |_, i| i % 3 == 1 }.map{ |character| character.sub(':', '') }
passwords = chunks.select.each_with_index{ |_, i| i % 3 == 2 }

positions = rules.map{ |rule| rule.split('-') }
first_position = positions.map{ |range| range[0].to_i }
second_position = positions.map{ |range| range[1].to_i }

valid = 0
passwords.each_with_index do |password, index|
  if (password[first_position[index] - 1] == characters[index]) ^ (password[second_position[index] - 1] == characters[index])
    valid += 1
  end
end

puts valid
