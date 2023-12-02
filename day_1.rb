file = File.open("./day_1_input.txt")
sum = 0

# part one
file.each_line do |line|
  line = line.gsub(/[a-z]/, "").chomp
  sum += (line[0] + line[-1]).to_i
end

puts sum
file.close

file = File.open("./day_1_input.txt")
sum = 0

# part 2
digits = {
  "one":   "1",
  "two":   "2",
  "three": "3",
  "four":  "4",
  "five":  "5",
  "six":   "6",
  "seven": "7",
  "eight": "8",
  "nine":  "9",
}

file.each_line do |line|
  dup_line = line.dup
  digits_added = 0

  digits.keys.each do |key|
    if line.include? key.to_s
    indexes = []
      line.scan key.to_s do
        dup_line.insert $~.offset(0)[0] + digits_added, digits[key]
        digits_added += 1
      end
    end
  end
  
  line = dup_line.gsub(/[a-z]/, "").chomp

  sum += (line[0] + line[-1]).to_i
end

puts sum
file.close