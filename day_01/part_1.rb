filename = 'day_01_input.txt'
expense_data = File.read(filename).split
entries = expense_data.map(&:to_i)
answer = nil
seen = {}
entries.each do |entry|
  complement = 2020 - entry
  if seen.key?(complement)
    answer = entry * complement
  end
  seen[entry] = complement
end
puts answer