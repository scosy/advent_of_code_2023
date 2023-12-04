input = File.open("day_4_input.txt")

cards = input.readlines

puts cards

winning_numbers = Hash.new { |k, v| k[v] = [] }
my_numbers = Hash.new { |k, v| k[v] = [] }

cards.each_with_index do |card, index|
  numbers = card.split(":")[1].split("|")
  numbers[0].split.each { |num| winning_numbers[index + 1] << num.to_i }
  numbers[1].split.each { |num| my_numbers[index + 1] << num.to_i }
end

# part one
# result = 0
# cards.size.times do |i|
#   result += 2.pow((winning_numbers[i + 1] & my_numbers[i + 1]).size - 1).floor
# end

# puts result

# part 2
total_cards = {}

cards.size.times do |i|
  total_cards[i + 1] = 1
end

cards.size.times do |i|
  wins = (winning_numbers[i + 1] & my_numbers[i + 1]).size
  (i + 2..wins + i + 1).each do |ii|
    total_cards[ii] += total_cards[i + 1]
  end
end

p winning_numbers
p my_numbers
p total_cards.values.sum
