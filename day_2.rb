input = File.open("day_2_input.txt")

games = {}
results = {}

input.each_line.with_index do |line, index|
  id = line.split(":")[0].split[1]
  games[id] = line.split(":")[1]
end

# part one
# red = 12
# green = 13
# blue = 14
# games.each do |id, game|
#   possible = true
#   game.split(";").each do |set|
#     set.split(",").each do |draw|
#       if draw.include? "red"
#         possible = false if draw.split[0].to_i > red
#       elsif draw.include? "green"
#         possible = false if draw.split[0].to_i > green
#       elsif draw.include? "blue"
#         possible = false if draw.split[0].to_i > blue
#       end
#     end
#     results[id] = possible
#   end
# end

# puts results.select { |k, v| v == true }.keys.map(&:to_i).sum

# part two
games.each do |id, game|
  max_red = 0
  max_green = 0
  max_blue = 0
  game.split(";").each do |set|
    set.split(",").each do |draw|
      if (draw.include? "red") && (draw.split[0].to_i > max_red)
        max_red = draw.split[0].to_i
      elsif (draw.include? "green") && (draw.split[0].to_i > max_green)
        max_green = draw.split[0].to_i
      elsif (draw.include? "blue") && (draw.split[0].to_i > max_blue)
        max_blue = draw.split[0].to_i
      end
    end
  end
  results[id] = [max_red, max_green, max_blue]
end

puts results.transform_values { |arr| arr.reduce(:*) }.values.sum
