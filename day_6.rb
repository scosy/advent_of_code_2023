def calculate_distance(time, distance_to_beat, race_nb)
  time.times do |i|
    btn_press = i
    speed = i
    time_left = time - btn_press
    distance = speed * time_left

    @ways_to_beat_record[race_nb] += 1 if distance > distance_to_beat
  end
end
input = File.open("day_6_input.txt").readlines.map(&:chomp)

races = []

input[0].split(":")[1].split.each_with_index { |time, index| races[index] = []; races[index] << time.to_i }
input[1].split(":")[1].split.each_with_index { |distance, index| races[index] << distance.to_i }
@ways_to_beat_record = Array.new(races.size, 0)

races.each_with_index do |(time, distance_to_beat), index|
  calculate_distance(time, distance_to_beat, index)
end

p @ways_to_beat_record.reduce(:*)
