filename = 'day_01_input.txt'
expense_data = File.read(filename).split
entries = expense_data.map(&:to_i)
first_product = nil
answer = nil
seen = {}
entries.each_with_index do |entry, index|
  entries.each_with_index do |second_entry, second_index|
    # Don't sum a number with itself.
    next if index == second_index
    number = 2020 - entry - second_entry
    if seen.key?(number)
      answer = number * second_entry * entry
    else
      seen[entry] = second_index
    end
  end
end
puts answer