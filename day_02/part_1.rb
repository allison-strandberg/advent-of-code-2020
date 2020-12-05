filename = 'day_02_input.txt'
chunks = File.read(filename).split

rules = chunks.select.each_with_index{ |_, i| i % 3 == 0 }
characters = chunks.select.each_with_index{ |_, i| i % 3 == 1 }.map{ |character| character.sub(':', '') }
passwords = chunks.select.each_with_index{ |_, i| i % 3 == 2 }

ranges = rules.map{ |rule| rule.split('-') }
mins = ranges.map{ |range| range[0].to_i }
maxes = ranges.map{ |range| range[1].to_i }

valid = 0
passwords.each_with_index do |password, i|
  occurrences = password.count(characters[i])
  if (maxes[i] >= occurrences) && (mins[i] <= occurrences)
    valid += 1
  end
end

puts valid