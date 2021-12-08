def dive(file_name)
  pos_x = 0
  pos_y = 0
  aim = 0
  File.open(file_name).each do |line|
    command = line.split(' ')
    direction = command[0]
    amount = command[1].to_i

    case direction
    when 'down'
      aim += amount
    when 'up'
      aim -= amount
    else
      pos_x += amount
      pos_y += amount * aim
    end
  end

  pos_x * pos_y
end
