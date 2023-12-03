rows = File.open("day_3_input.txt").map(&:chomp)
# symbols = []
gears = []

rows.each_with_index do |row, x|
  row.each_char.with_index do |char, y|
    # next if char == "."
    # next if char.match?(/\d/)

    # symbols << [x, y]
    gears << [x, y] if char == "*"
  end
end
sum = 0
# locations = []
gears.each do |(x, y)|
  starts = Set.new
  [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ].each do |(dx, dy)|
    nx = x + dx
    ny = y + dy

    if rows[nx][ny].match?(/\d/)
      # locations << [nx, ny]

      nny = ny
      while rows[nx][nny - 1].match?(/\d/)
        nny -= 1
      end
      starts << [nx, nny]
    end
  end
  if starts.length == 2
    result = starts.map do |(x, y)|
      rows[x][y..].to_i
    end.inject(:*)
    sum += result
  end
end

p sum

# starts = Set.new
# locations.each do |(x, y)|
#   while rows[x][y - 1].match?(/\d/)
#     y -= 1
#   end
#   starts << [x, y]
# end

# result = starts.map do |(x, y)|
#   rows[x][y..].to_i
# end.sum

# p result
