input = File.read("day_7_input.txt").split("\n")

hands = []

input.each do |line|
  h, b = line.split
  bid = b.to_i
  cards = h.chars.map do |char|
    {
      "A" => 14,
      "K" => 13,
      "Q" => 12,
      "J" => 1,
      "T" => 10
    }[char] || char.to_i
  end
  hands << [cards, h, bid]
end

r = hands.map do |(cards, h, bid)|
  joker_count = cards.count(1)
  non_joker_cards = cards.select { _1 != 1 }

  counts = non_joker_cards.group_by(&:itself).transform_values(&:count)

  if counts.values.any? { _1 == 5 }
    [5, cards, bid]
  elsif counts.values.any? { _1 == 4 }
    [4 + joker_count, cards, bid]
  elsif counts.values.any? { _1 == 3 } && counts.values.any? { _1 == 2 }
    [3.5 + joker_count, cards, bid]
  elsif counts.values.any? { _1 == 3 }
    [3 + joker_count, cards, bid]
  elsif counts.values.count { _1 == 2 } == 2
    [2.5 + joker_count, cards, bid]
  elsif counts.values.any? { _1 == 2 }
    [2 + joker_count, cards, bid]
  else
    [[1 + joker_count, 5].min, cards, bid]
  end
end

p r.sort.map.with_index { _1[2] * (_2 + 1) }.sum
