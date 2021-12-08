def dive(file_name)
  pos_x = 0
  pos_y = 0
  File.open(file_name).each do |line|
    command = line.split(' ')
    direction = command[0]
    amount = command[1].to_i

    case direction
    when 'down'
      pos_y += amount
    when 'up'
      pos_y -= amount
    else
      pos_x += amount
    end
  end

  pos_x * pos_y
end
